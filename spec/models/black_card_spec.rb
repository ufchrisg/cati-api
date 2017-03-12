require 'rails_helper'

RSpec.describe BlackCard, type: :model do
  before(:all) { @black_card = FactoryGirl.build(:black_card) }

  describe "validations" do  
    it "is valid" do
      expect(@black_card).to be_valid
    end
    it "is not valid without text" do
      @black_card.text = nil
      expect(@black_card).not_to be_valid
    end
    it "is not valid without any blanks" do
      @black_card.text = "No blanks here"
      expect(@black_card).not_to be_valid
    end
  end

end
