class CreateIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :introductions do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true
      t.string :code, unique: true
      t.timestamps
    end
  end
end
