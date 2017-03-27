class BlackCard < ApplicationRecord
	validates :text, format: { with: /\{_\}/ }, uniqueness: true
	belongs_to :pack
end
