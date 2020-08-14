class AddReferenceToFollow < ActiveRecord::Migration[6.0]
  def change
    add_reference :follows, :user, foreign_key: true
    add_reference :follows, :artist, foreign_key: true
  end
end
