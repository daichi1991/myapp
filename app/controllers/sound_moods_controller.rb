class SoundMoodsController < ApplicationController

  def new
    @sound_mood = SoundMood.new
  end

  def create
    if @sound_mood = SoundMood.create(sound_mood_params)
      redirect_to '/'
    else
      redirect_to new_sound_mood_path
    end
  end

  def sound_mood_params
    params.require(:sound_mood).permit(:mood_name, :image)
  end
end
