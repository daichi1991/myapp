class AddFollowsCountToArtists < ActiveRecord::Migration[6.0]
  class MigrationUser < ApplicationRecord
    self.table_name = :artists
  end

  def up
    _up
  rescue => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    MigrationUser.reset_column_information

    add_column :artists, :follows_count, :integer, null: false, default: 0 unless column_exists? :artists, :follows_count
  end

  def _down
    MigrationUser.reset_column_information

    remove_column :artists, :follows_count if column_exists? :artists, :follows_count
  end
end