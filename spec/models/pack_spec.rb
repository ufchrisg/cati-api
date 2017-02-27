require 'rails_helper'

RSpec.describe Pack, type: :model do

  describe "validations" do
    it "is valid" do
      pack = FactoryGirl.build(:pack)
      expect(pack).to be_valid
    end
    it "is not valid without a name" do
      pack = FactoryGirl.build(:no_name_pack)
      expect(pack).not_to be_valid
    end
  end

end
