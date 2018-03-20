class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])

    return redirect_to signin_path unless user && user.authenticate(params[:user][:password])

    session[:user_id] = user.id

    redirect_to user
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
