class RemoveBuyoutPriceFromSounds < ActiveRecord::Migration[6.0]
  def change
    remove_column :sounds, :buyout_price
  end
end
