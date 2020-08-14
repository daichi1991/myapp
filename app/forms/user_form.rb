class UserForm

  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :email, :string, default: nil
  attribute :username, :string, default: nil
  attribute :password_confirmation, :string, default: nil

  attribute :user_id, :bigint, default: nil
  attribute :description, :text, default: nil
  attribute :image, :string, default: nil
  attribute :status, :boolean, default: nil


  attribute :artist_id, :bigint, default: nil
  attribute :url, :string, default: nil

  validates :email, presence: true
  validates :username, presence: true
  validates :password_confirmation, presence: true

  validates :user_id, presence: true
  validates :status, presence: true

  validates :artist_id, presence: true


  def save_new
    user = User.new(user_params)
    if user.save
      artist = Artist.new(user_id: user.id)
      if artist.save
        youtube = Youtube.new(artist_id: artist.id)
      end
    end
  end

  def save_update
    user = User.find(user_id)
    if user.update(user_params)
      artist = Artist.find_by(user_id: user_id)
      if artist.update(artist_params)
        youtube = Youtube.find_by(artist_id :artist.id)
        youtube.update(youtube_params)
      end
    end
  end

  def user_params
    params.require(:user).permit( :email, :username, :password, :password_confirmation )
  end

  def artist_params
    params.require(:artist).permit(:description, :user_id, :image, :status)
  end

  def youtube_params
    params.require(:youtube).permit(:artist_id, :url)
  end

end
