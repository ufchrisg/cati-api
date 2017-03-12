FactoryGirl.define do
  factory :black_card do
    text "Riddle me this: {_}"
  end
  factory :updated_black_card, class: BlackCard do
    text "Riddle me that: {_}"
  end
  factory :invalid_black_card, class: BlackCard do
    text "Invalid text"
  end
end
