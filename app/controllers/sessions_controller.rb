class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @questions = Question.all
    @comment = Comment.new
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back #{user.username}!"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid username or password. Please try again."
      render "questions/index"
    end
  end
end
