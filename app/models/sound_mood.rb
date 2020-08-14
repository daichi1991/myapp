class SoundMood < ApplicationRecord
  mount_uploader :image, ImagesUploader

  has_many :sounds

end
