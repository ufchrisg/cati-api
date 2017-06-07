class WhiteCard < ApplicationRecord
  validates :text, presence: true, uniqueness: true
end
