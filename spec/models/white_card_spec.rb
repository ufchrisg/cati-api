require "rails_helper"

RSpec.describe WhiteCard, type: :model do
  describe "validations" do
    before(:each) { @white_card = FactoryGirl.build(:white_card) }
    it "is valid" do
      expect(@white_card).to be_valid
    end
    it "is not valid without text" do
      @white_card.text = nil
      expect(@white_card).not_to be_valid
    end
    it "requires unique text" do
      FactoryGirl.create(:white_card)
      white_card = FactoryGirl.build(:white_card)
      expect(white_card).not_to be_valid
    end
  end
end
