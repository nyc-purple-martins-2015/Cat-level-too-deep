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

  private

  def question_params
    params.require(:question).permit(:title, :query, :user_id, :best_answer_id )
  end
end

