class FollowsController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @follows = Follow.where(artist_id: @artist.id)
  end

  def create
    @artist = Artist.find(params[:artist_id])
    unless @artist.follow?(current_user)
      @artist.follow(current_user)
      @artist.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @follow = Follow.find(params[:id])
    @artist = Artist.find(@follow.artist_id)
    if @artist.follow?(current_user)
      @artist.unfollow(current_user)
      @artist.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
