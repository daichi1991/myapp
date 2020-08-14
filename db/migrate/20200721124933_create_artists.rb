class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.text :possible_category
      t.text :description
      t.timestamps
    end
  end
end
