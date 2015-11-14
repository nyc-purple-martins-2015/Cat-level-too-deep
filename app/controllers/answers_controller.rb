class AnswersController < ApplicationController
  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      flash.now[:notice] = "Response can't be blank."
      render :"questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:response).merge(user: current_user, question: @question)
  end
end
