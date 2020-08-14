class Sound < ApplicationRecord

  mount_uploader :audio_file, AudioFileUploader

  acts_as_taggable

  belongs_to :artist
  belongs_to :sound_category
  belongs_to :sound_mood

  has_many :auctions
  has_many :purchases
  has_many :purchase_user, through: :purchases, source: :user

  has_many :watches, dependent: :destroy
  has_many :watch_users, through: :watches, source: :user

  def watch(user)
    watches.create(user_id: user.id)
  end


  def unwatch(user)
    watches.find_by(user_id: user.id).destroy
  end

  def watch?(user)
    watch_users.include?(user)
  end

  def purchase?(user)
    purchase_user.include?(user)
  end

end
