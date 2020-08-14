class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  counter_culture :artist
  validates :user_id, presence: true
  validates :artist_id, presence: true

end
