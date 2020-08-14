class AddReferenceToArtist < ActiveRecord::Migration[6.0]
  def change
    add_reference :artists, :user, foreign_key: true
    add_reference :artists, :youtube, foreign_key: true
  end
end
