class CreateSoundMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :sound_moods do |t|
      t.string :mood_name
      t.timestamps
    end
  end
end
