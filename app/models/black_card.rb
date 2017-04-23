class BlackCard < ApplicationRecord
	validates :text, presence: true, uniqueness: true
	validate :vars_are_numeric, :vars_are_ordered
	belongs_to :pack

	after_validation :update_num_vars, if: :text_changed?
	
	def num_draw
		if num_vars < 3
			return 0
		end
		num_vars - 1
	end
	
	private

	def vars_are_numeric
		return unless text
		text.match(/\{[^\}]{2,}\}/) { |m| errors.add(:text, "#{m} is not valid") }
		text.match(/\{[^1-3\}]*\}/) { |m| errors.add(:text, "#{m} is not valid") }
	end

	def vars_are_ordered
		return unless text
		vars = get_vars()
		return unless vars.length > 0
		unless vars[0] == "1"
			errors.add(:text, "first variable must be 1")
		end
		unless vars.each_cons(2).all? { |a,b| a.to_i+1 == b.to_i }
			errors.add(:text, "variables must be in sequential order")
		end
	end

	def get_vars
		text.scan(/\{([1-3])\}/).flatten
	end
	
	def update_num_vars
		vars = get_vars().length
		if vars == 0
			if self.num_vars_changed?
				vars = self.num_vars
			else
				vars = 1
			end
		end
		self.num_vars = vars
	end
end
