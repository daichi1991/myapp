class SearchesController < ApplicationController
  def index
    @categories = SoundCategory.all.order(id:"ASC")
    @moods = SoundMood.all.order(id:"ASC")
    @q = Sound.includes(:sound_categories, :sound_moods).ransack(params[:q])
    @result = @q.result(distinct: true)
  end

  def result
    if params[:tag_name]
      @sounds = Sound.tagged_with("#{params[:tag_name]}").page(params[:page]).per(10)
    else
      @q = Sound.search(search_params)
      @sounds = @q.result(distinct: true).page(params[:page]).per(5)
    end
  end

  def search_params
    params.require(:q).permit!
  end

end
