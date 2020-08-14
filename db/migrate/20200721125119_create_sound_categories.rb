class CreateSoundCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :sound_categories do |t|
      t.string :category_name
      t.timestamps
    end
  end
end
