require "rails_helper"

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
    it "requires unique name" do
      pack1 = FactoryGirl.create(:pack)
      pack2 = FactoryGirl.build(:pack, name: pack1.name)
      expect(pack2).not_to be_valid
    end
  end

  describe "associations" do
    it "has many black cards" do
      association = described_class.reflect_on_association(:black_cards)
      expect(association.macro).to eq :has_many
    end
  end
end
