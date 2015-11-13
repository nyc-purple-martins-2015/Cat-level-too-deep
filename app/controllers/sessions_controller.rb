class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to root_path
    else
      flash[:alert] = "Invalid username or password. Please try again."
      render "sessions/new"
    end
  end
end