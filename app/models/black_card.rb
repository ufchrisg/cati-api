class BlackCard < ApplicationRecord
	validates :text, format: { with: /\{_\}/ }
end
