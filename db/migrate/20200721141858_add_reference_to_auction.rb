class AddReferenceToAuction < ActiveRecord::Migration[6.0]
  def change
      add_reference :auctions, :sound, foreign_key: true
  end
end
