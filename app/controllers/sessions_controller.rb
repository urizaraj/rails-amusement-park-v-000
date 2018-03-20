class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])

    return redirect_to signin_path unless user && user.authenticate(params[:user][:password])

    session[:user_id] = user.id

    redirect_to user
  end
end
