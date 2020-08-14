class UsersController < ApplicationController

  before_action :authenticate_user!

  def new
    @user = UserForm.new
  end

  def create
    @user = UserForm.new(user_params)
    if @user.save_new
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @purchases = Purchase.where(user_id: @user.id).page(params[:page]).per(5)
  end






  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to new_artist_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :image )
  end


end
