class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
    @artist.build_youtube
  end

  def create
    if @artist = Artist.create(artist_params)
      redirect_to artist_path(@artist.id)
    else
      redirect_to new_artist_path
    end
  end

  def edit
    @artist = Artist.find_by(user_id: current_user.id)
  end

  def update
    @artist = Artist.find_by(user_id: current_user.id)
    if @artist.update(artist_params)
      redirect_to artist_path(@artist.id)
    else
      redirect_to new_artist_path
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @sounds = Sound.where(artist_id: @artist.id).page(params[:page]).per(3)
  end

  def artist_params
    params.require(:artist).permit(:status, :description, :user_id, :image, youtube_attributes: [:id, :url])
  end

end
