class Pack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :black_cards
  has_many :white_cards
end
