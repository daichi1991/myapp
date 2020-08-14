class AddReferenceToYoutubes < ActiveRecord::Migration[6.0]
  def change
    add_reference :youtubes, :artist, foreign_key: true
  end
end
