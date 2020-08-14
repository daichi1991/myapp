class RenameFileColumnToSounds < ActiveRecord::Migration[6.0]
  def change
    rename_column :sounds, :file, :audio_file
  end
end
