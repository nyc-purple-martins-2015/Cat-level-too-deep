class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.password == params[:password]
      flash[:notice] = "Welcome back!"
      session[:user_id] = user.id
    else
      flash[:alert] = "Invalid username or password. Please try again."
    end
    redirect_to root_path
  end
end