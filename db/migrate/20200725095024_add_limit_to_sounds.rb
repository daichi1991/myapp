class AddLimitToSounds < ActiveRecord::Migration[6.0]
  def change
    add_column :sounds, :limit_date, :date
    add_column :sounds, :limit_time, :time
  end
end
