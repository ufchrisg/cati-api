require "rails_helper"

RSpec.describe BlackCard, type: :model do
  describe "validations" do
    before(:each) { @black_card = FactoryGirl.build(:black_card) }
    it "is valid" do
      expect(@black_card).to be_valid
    end
    it "is not valid without text" do
      @black_card.text = nil
      expect(@black_card).not_to be_valid
    end
    it "requires unique text" do
      FactoryGirl.create(:black_card)
      black_card = FactoryGirl.build(:black_card)
      expect(black_card).not_to be_valid
    end
    describe "text with variables" do
      it "is valid with variables" do
        @black_card.text = "{1} me the {2}, {3}"
        expect(@black_card).to be_valid
      end
      it "is not valid with bad variable name" do
        @black_card.text = "This has an invalid variable, {i}"
        expect(@black_card).not_to be_valid
      end
      it "is not valid with out of sequence variables" do
        @black_card.text = "These {2} variables {1} are not in order"
        expect(@black_card).not_to be_valid
      end
      it "is not valid with gaps in variable numbers" do
        @black_card.text = "{1} cannot skip to {3}"
        expect(@black_card).not_to be_valid
      end
      it "is not valid if first variable is not 1" do
        @black_card.text = "{2} cannot be the first"
        expect(@black_card).not_to be_valid
      end
      it "is not valid with more than three variables" do
        @black_card.text = "{1} {2} {3} {4} has too many variables"
        expect(@black_card).not_to be_valid
      end
    end
  end

  describe "associations" do
    it "belongs to a pack" do
      association = described_class.reflect_on_association(:pack)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "num_vars" do
    before(:each) { @black_card = FactoryGirl.create(:black_card_no_vars) }
    it "sets num_vars for new card" do
      expect(@black_card.num_vars).to eq(1)
    end
    it "can be explicitly set if no vars in text" do
      @black_card.text = "Make a haiku."
      @black_card.num_vars = 3
      @black_card.save
      expect(@black_card.num_vars).to eq(3)
    end
    it "uses implicit value if text has vars" do
      @black_card.text = "{1} {2} {3} vars but trying to say we have 2"
      @black_card.num_vars = 2
      @black_card.save
      expect(@black_card.num_vars).to eq(3)
    end
    it "resets to 1 if not explicitly setting and removing vars from text" do
      black_card = FactoryGirl.create(:black_card_with_vars)
      black_card.text = "What time is it?"
      black_card.save
      expect(black_card.num_vars).to eq(1)
    end
    it "updates num_vars when text updated" do
      @black_card.text = "This {1} has {2} variables"
      @black_card.save
      expect(@black_card.num_vars).to eq(2)
    end
  end

  describe "num_draw" do
    before(:each) { @black_card = FactoryGirl.build(:black_card_no_vars) }
    it "has value of 0 for <= 2 vars" do
      @black_card.text = "{1}"
      @black_card.save
      expect(@black_card.num_draw).to eq(0)
      @black_card.text = "{1} {2}"
      @black_card.save
      expect(@black_card.num_draw).to eq(0)
    end
    it "has value of 2 for 3 vars" do
      @black_card.text = "{1} {2} {3} this card asks you to draw 2"
      @black_card.save
      expect(@black_card.num_draw).to eq(2)
    end
    it "has value of 2 for num_vars explicitly set to 3" do
      @black_card.text = "No-var text with explicit num_vars of 3"
      @black_card.num_vars = 3
      @black_card.save
      expect(@black_card.num_vars).to eq(3)
      expect(@black_card.num_draw).to eq(2)
    end
  end
end
