class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @sound = Sound.find_by(id: params[:sound_id])

  end

  def confirm
    @purchase = Purchase.new(purchase_params)
    @sound = Sound.find_by(id: @purchase.sound_id)
    render :new if @purchase.invalid?

  end

  def create
    @purchase = Purchase.new(purchase_params)
    respond_to do |format|
      if params[:back]
        format.html { render :new }
      elsif @purchase.save
        unless Introduction.exists?(user_id: @purchase.user_id, artist_id: @purchase.sound.artist_id)
          icode = SecureRandom.hex(8)
          @introduction = Introduction.new(user_id: @purchase.user_id, artist_id: @purchase.sound.artist_id, code: icode)
          if @introduction.save
            format.html { redirect_to @purchase, notice: 'Purchase
              was successfully created.' }
            format.json { render :show, status: :created, location: @purchase }
          end
        else
          format.html { redirect_to @purchase, notice: 'Purchase
            was successfully created.' }
          format.json { render :show, status: :created, location: @purchase }
        end
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @sound = Sound.find(@purchase.sound.id)
    @introduction = Introduction.find_by(user_id: @purchase.user_id, artist_id: @sound.artist_id)

  end

  def download
    @sound = Sound.find(params[:id])
    filepath = @sound.audio_file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @sound.audio_file_identifier, :length => stat.size)
  end

  def purchase_params
    params.require(:purchase).permit(:sound_id, :user_id)
  end

end
