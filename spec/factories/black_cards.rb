FactoryGirl.define do
  factory :black_card do
    pack
    text "Why so serious?"
  end
  factory :updated_black_card, class: BlackCard do
    text "Why not so serious?"
  end
  factory :invalid_black_card, class: BlackCard do
  end
end
