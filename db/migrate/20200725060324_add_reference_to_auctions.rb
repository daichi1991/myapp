class AddReferenceToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_reference :auctions, :user, foreign_key: true
  end
end