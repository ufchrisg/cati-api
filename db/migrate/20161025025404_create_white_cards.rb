class CreateWhiteCards < ActiveRecord::Migration[5.0]
  def change
    create_table :white_cards do |t|
      t.string :answer

      t.timestamps
    end
  end
end
