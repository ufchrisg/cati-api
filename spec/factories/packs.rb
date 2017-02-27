FactoryGirl.define do
  factory :pack do
    name "Original"
  end
  factory :updated_pack, class: Pack do
    name "Pack 1"
  end
  factory :no_name_pack, class: Pack do
  end
end
