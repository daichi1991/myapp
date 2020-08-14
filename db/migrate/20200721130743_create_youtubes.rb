class CreateYoutubes < ActiveRecord::Migration[6.0]
  def change
    create_table :youtubes do |t|
      t.string :url
      t.timestamps
    end
  end
end
