class AddNumVarsToBlackCard < ActiveRecord::Migration[5.0]
  def change
    add_column :black_cards, :num_vars, :int
  end
end
