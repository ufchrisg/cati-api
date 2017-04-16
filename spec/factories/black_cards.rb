FactoryGirl.define do
  factory :black_card do
    pack
    text "Why so serious?"
  end
  factory :black_card_no_vars, class: BlackCard do
    pack
    text "This card has no vars"
  end
  factory :black_card_with_vars, class: BlackCard do
    pack
    text "This {1} has some {2} to {3}"
  end
  factory :updated_black_card, class: BlackCard do
    text "Why not so serious?"
  end
  factory :invalid_black_card, class: BlackCard do
  end
end
