class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :check_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)

    return render :new unless @user.save

    session[:user_id] = @user.id

    redirect_to @user
  end

  private

  def strong_params
    params.require(:user).permit(*%i[name password happiness nausea tickets height admin])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_logged_in
    return redirect_to root_path unless logged_in?
  end
end
