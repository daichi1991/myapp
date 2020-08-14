class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImagesUploader

  has_many :auctions
  has_many :purchases, dependent: :destroy

  has_one :artist, dependent: :destroy


  has_many :follows, dependent: :destroy
  has_many :followed_artists, through: :follows, source: :aritst

  has_many :watches, dependent: :destroy
  has_many :watched_sounds, through: :watches, source: :sound

  has_many :introductions, dependent: :destroy

  def with_artist
    self.artist.build
    self
  end

end
