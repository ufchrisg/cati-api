class BlackCard < ApplicationRecord
	validates :text, presence: true, uniqueness: true
	belongs_to :pack
end
