class AnswersController < ApplicationController

  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to("/questions/#{@question.id}")
    else
      flash.now[:notice] = "Response can't be blank."
      render :"questions/show"
    end
  end

  private

  def convo_params
    params.require(:answer).permit(:response).merge(user: current_user, question: @question)
  end


end
