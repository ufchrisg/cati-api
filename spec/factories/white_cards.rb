FactoryGirl.define do
  factory :white_card do
    pack
    text "Because, BATMAN!"
  end
  factory :updated_white_card, class: WhiteCard do
    text "But not Robin."
  end
  factory :invalid_white_card, class: WhiteCard do
  end
end
