class BlackCard < ApplicationRecord
	validates :text, presence: true, uniqueness: true
	validate :vars_are_numeric, :vars_are_ordered
	belongs_to :pack

	def vars_are_numeric
		return unless text
		text.match(/\{[^\}]{2,}\}/) { |m| errors.add(:text, "#{m} is not valid") }
		text.match(/\{[^1-3\}]*\}/) { |m| errors.add(:text, "#{m} is not valid") }
	end

	def vars_are_ordered
		return unless text
		vars = text.scan(/\{([1-3])\}/).flatten
		return unless vars.length > 0
		unless vars[0] == "1"
			errors.add(:text, "first variable must be 1")
		end
		unless vars.each_cons(2).all? { |a,b| a.to_i+1 == b.to_i }
			errors.add(:text, "variables must be in sequential order")
		end
	end
end
