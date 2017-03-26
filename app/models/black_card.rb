class BlackCard < ApplicationRecord
	validates :text, format: { with: /\{_\}/ }, uniqueness: true
end
