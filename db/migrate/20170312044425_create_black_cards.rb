class CreateBlackCards < ActiveRecord::Migration[5.0]
  def change
    create_table :black_cards do |t|
      t.string :text

      t.timestamps
    end
  end
end
