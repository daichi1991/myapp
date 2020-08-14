class SoundsController < ApplicationController

  def new
    @sound = Sound.new
    @sound_category = SoundCategory.all.order(id:"ASC")
    @sound_mood = SoundMood.all.order(id:"ASC")
    @aritst = Artist.find_by(user_id: current_user.id)
  end

  def confirm
    @sound = Sound.new(sound_params)
    @aritst = Artist.find_by(user_id: current_user.id)
    render :new if @sound.invalid?
  end

  def create
    @sound = Sound.new(sound_params)
    @sound.audio_file.retrieve_from_cache! @sound.audio_file.cache_name
    respond_to do |format|
      if params[:back]
        format.html { render :new }
      elsif @sound.save
        format.html { redirect_to @sound, notice: 'Sound
          was successfully created.' }
        format.json { render :show, status: :created, location: @sound }
      else
        format.html { render :new }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @sound = Sound.find(params[:id])

  end

  def sound_params
    params.require(:sound).permit(:audio_file, :audio_file_cache, :description, :price,:status ,:artist_id ,:sound_category_id, :sound_mood_id, :tag_list, :title)
  end

end
