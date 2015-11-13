class QuestionsController < ApplicationController

  def index
    @questions = Question.includes(:tags)
  end

  def show
    @question = Question.find(params[:id])
  end
end