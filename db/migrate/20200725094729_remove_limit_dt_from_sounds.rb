class RemoveLimitDtFromSounds < ActiveRecord::Migration[6.0]
  def change
    remove_column :sounds, :limit_dt
  end
end
