class VotesController < ApplicationController
  def create
    if !logged_in?
      flash[:alert] = "Please log in"
      return redirect_to root_path
    end

    @vote = Vote.new(vote_params)
    if @vote.save && @vote.votable_type == "Question"
      redirect_to questions_path
    elsif @vote.save && @vote.votable_type == "Answer"
      redirect_to question_path(id: Answer.find(@vote.votable_id).question.id)
    else
      flash.now[:alert] = "Vote could not be submitted."
      render :index
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :votable_id, :votable_type, :user_id )
  end
end
