class ChangeColumnToSounds < ActiveRecord::Migration[6.0]
  def change
    rename_column :sounds, :start_price, :price
    remove_column :sounds, :buyout
    remove_column :sounds, :auction_id
    remove_column :sounds, :limit_date
    remove_column :sounds, :limit_time
  end
end
