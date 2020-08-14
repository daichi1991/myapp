class WatchesController < ApplicationController

  def index
    @watches = Watch.where(user_id: current_user.id).page(params[:page]).per(5)
  end

  def create
    @sound = Sound.find(params[:sound_id])
    unless @sound.watch?(current_user)
      @sound.watch(current_user)
      @sound.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @watch = Watch.find(params[:id])
    @sound = Sound.find(@watch.sound_id)
    if @sound.watch?(current_user)
      @sound.unwatch(current_user)
      @sound.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end


end
