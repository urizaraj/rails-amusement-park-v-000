class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)

    return render :new unless @user.save

    session[:user_id] = @user.id

    redirect_to @user
  end

  def show

  end

  private

  def strong_params
    params.require(:user).permit(*%i[name password happiness nausea tickets height])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
