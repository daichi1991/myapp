class CreateSounds < ActiveRecord::Migration[6.0]
  def change
    create_table :sounds do |t|
      t.text :file
      t.text :description
      t.integer :start_price
      t.boolean :buyout
      t.integer :buyout_price
      t.datetime :limit_dt
      t.integer :status
      t.timestamps
    end
  end
end
