class AddReferenceToWatch < ActiveRecord::Migration[6.0]
  def change
    add_reference :watches, :user, foreign_key: true
    add_reference :watches, :sound, foreign_key: true
  end
end
