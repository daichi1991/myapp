class AddBuyoutToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :buyout, :boolean
  end
end
