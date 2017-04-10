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
  end

  describe "associations" do
    it "belongs to a pack" do
      association = described_class.reflect_on_association(:pack)
      expect(association.macro).to eq :belongs_to
    end
  end
end
