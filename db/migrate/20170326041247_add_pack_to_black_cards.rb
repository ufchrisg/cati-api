class AddPackToBlackCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :black_cards, :pack, index: true
  end
end
