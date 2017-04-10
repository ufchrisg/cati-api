require 'rails_helper'

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
end
