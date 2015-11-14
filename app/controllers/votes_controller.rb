class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save && @vote.votable_type == "Question"
      redirect_to questions_path
    elsif @vote.save && @vote.votable_type == "Answer"
      redirect_to question_path(id: Answer.find(@vote.votable_id).question.id)
    else
      flash.now[:notice] = "Response can't be blank."
      render :index
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :votable_id, :votable_type, :user_id )
  end
end
