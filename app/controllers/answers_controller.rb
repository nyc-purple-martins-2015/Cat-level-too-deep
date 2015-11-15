class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params)
    @comment = Comment.new
    if @answer.save
      redirect_to question_path(@question)
    else
      flash.now[:alert] = "Response can't be blank and you must be logged in."
      render :"questions/show"
    end
  end

  private

  def answer_params
    return nil if !logged_in?
    params.require(:answer).permit(:response).merge(user: current_user, question: @question)
  end
end
