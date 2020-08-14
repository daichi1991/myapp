class AuctionsController < ApplicationController
  def index

  end

  def new
    @auction = Auction.new
    @sound = Sound.find_by(id: params[:sound_id])

  end

  def confirm
    @auction = Auction.new(auction_params)
    render :new if @auction.invalid?

  end

  def create
    @auction = Auction.new(auction_params)

    if @auction.buyout == true
      @sound = Sound.find(@auction.sound_id)
      @sound.update(status: 2, auction_id: @auction.id )
    end

    respond_to do |format|
      if params[:back]
        format.html { render :new }
      elsif @auction.save
        format.html { redirect_to @auction, notice: 'Bid
          was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def auction_params
    params.require(:auction).permit(:bid_price, :sound_id, :user_id, :buyout )
  end

  def sound_params
    params.require(:sound).permit(:file, :description, :start_price, :buyout, :limit_dt ,:status ,:artist_id ,:sound_category_id, :sound_mood_id, :tag_list)
  end

end
