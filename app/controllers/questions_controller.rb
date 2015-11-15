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
    if params[:tags]
      tag_array = params[:tags].split(",")
      tag_array.each do |user_tag|
        @question.tags << Tag.find_or_create_by(category: user_tag)
      end
    end
    if @question.save
      redirect_to questions_path
    else
      flash.now[:alert] = "Please have both forms completed before creating a question."
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :query, :best_answer_id, :user_id )
  end
end
