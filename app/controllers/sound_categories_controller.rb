class SoundCategoriesController < ApplicationController

  def new
    @sound_category = SoundCategory.new
  end

  def create
    if @sound_category = SoundCategory.create(sound_category_params)
      redirect_to '/'
    else
      redirect_to new_sound_category_path
    end
  end

  def sound_category_params
    params.require(:sound_category).permit(:category_name, :image)
  end

end
