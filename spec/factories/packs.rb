FactoryGirl.define do
  factory :pack do
    sequence(:name) { |n| "Pack #{n}" }
  end
  factory :updated_pack, class: Pack do
    sequence(:name) { |n| "Expansion #{n}" }
  end
  factory :no_name_pack, class: Pack do
    name ""
  end
end
