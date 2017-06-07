class AddPackToWhiteCards < ActiveRecord::Migration[5.1]
  def change
    add_reference :white_cards, :pack, index: true
  end
end
