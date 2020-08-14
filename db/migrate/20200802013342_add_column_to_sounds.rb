class AddColumnToSounds < ActiveRecord::Migration[6.0]
  def change
    add_column :sounds, :title, :string
  end
end
