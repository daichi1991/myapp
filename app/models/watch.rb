class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :sound
  counter_culture :sound
  validates :user_id, presence: true
  validates :sound_id, presence: true
end
