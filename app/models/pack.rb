class Pack < ApplicationRecord
	validates :name, presence: true, uniqueness: true
end
