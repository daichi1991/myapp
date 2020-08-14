class AddReferenceToSound < ActiveRecord::Migration[6.0]
  def change
    add_reference :sounds, :artist, foreign_key: true
    add_reference :sounds, :sound_category, foreign_key: true
    add_reference :sounds, :sound_mood, foreign_key: true
    add_reference :sounds, :auction, foreign_key: true
  end
end
