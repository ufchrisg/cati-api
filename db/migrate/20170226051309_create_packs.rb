class CreatePacks < ActiveRecord::Migration[5.0]
  def change
    create_table :packs do |t|
      t.string :name

      t.timestamps
    end
  end
end
