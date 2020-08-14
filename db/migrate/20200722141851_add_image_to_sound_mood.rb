class AddImageToSoundMood < ActiveRecord::Migration[6.0]
  def change
    add_column :sound_moods, :image, :string
  end
end
