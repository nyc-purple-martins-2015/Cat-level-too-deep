class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render :index
  end

  def new
    render :new
  end

  def show
    render :show
  end

  def create
  end
end

