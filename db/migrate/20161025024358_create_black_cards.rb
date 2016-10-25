class CreateBlackCards < ActiveRecord::Migration[5.0]
  def change
    create_table :black_cards do |t|
      t.string :phrase

      t.timestamps
    end
  end
end
