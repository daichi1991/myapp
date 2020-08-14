class AddImageToSoundCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :sound_categories, :image, :string
  end
end
