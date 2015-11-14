class VotesController < ApplicationController

  def create do
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to questions_path
    else
      render :index
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :votable, :user_id )
  end

end
