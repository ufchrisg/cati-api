class Pack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :black_cards
end
