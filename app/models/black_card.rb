class BlackCard < ApplicationRecord
  validate :vars_are_numeric, :vars_are_ordered, :vars_start_at_one
  validates :text, presence: true, uniqueness: true
  belongs_to :pack

  after_validation :update_num_vars, if: :text_changed?

  def num_draw
    return 0 if num_vars < 3
    num_vars - 1
  end

  private

  def vars_are_numeric
    return unless text
    text.match(/\{[^\}]{2,}\}/) { |m| errors.add(:text, "#{m} is not valid") }
    text.match(/\{[^1-3\}]*\}/) { |m| errors.add(:text, "#{m} is not valid") }
  end

  def vars_start_at_one
    @vars = vars
    return if @vars.length.zero?
    errors.add(:text, "first variable must be 1") unless @vars[0] == "1"
  end

  def vars_are_ordered
    @vars = vars
    return if @vars.length.zero?
    unless @vars.each_cons(2).all? { |a, b| a.to_i + 1 == b.to_i }
      errors.add(:text, "variables must be in sequential order")
    end
  end

  def vars
    return [] unless text
    text.scan(/\{([1-3])\}/).flatten
  end

  def update_num_vars
    @num_vars = vars.length
    @num_vars = num_vars_changed? ? num_vars : 1 if @num_vars.zero?
    self.num_vars = @num_vars
  end
end
