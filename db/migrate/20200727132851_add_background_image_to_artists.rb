class AddBackgroundImageToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :image, :string
  end
end
