class ChangeColumnToPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchases, :artist, index: true
    add_reference :purchases, :sound, foreign_key: true
  end
end
