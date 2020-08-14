class Artist < ApplicationRecord

  mount_uploader :image, BackgroundImageUploader


  belongs_to :user

  has_many :sounds

  has_one :youtube, dependent: :destroy
  accepts_nested_attributes_for :youtube, allow_destroy: false



  has_many :follows, dependent: :destroy
  has_many :follow_users, through: :follows, source: :user

  has_many :introductions, dependent: :destroy



  def follow(user)
    follows.create(user_id: user.id)
  end


  def unfollow(user)
    follows.find_by(user_id: user.id).destroy
  end

  def follow?(user)
    follow_users.include?(user)
  end

end
