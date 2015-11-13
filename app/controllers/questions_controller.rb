class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def show
    @question=Question.find_by(id: params[:id])
    if @question
      render :show
    else
      # doesnt exist bad request erb
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :query, :best_answer_id, :user_id )
  end
end

