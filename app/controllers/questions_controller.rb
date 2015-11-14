class QuestionsController < ApplicationController
  def index
    @comment = Comment.new
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def show
    @comment = Comment.new
    @answer = Answer.new
    @question = Question.find_by(id: params[:id])
    if @question
      render :show
    else
      render_404
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
