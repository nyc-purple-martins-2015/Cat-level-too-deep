class CommentsController < ApplicationController

  def create
    @questions = Question.all
    @comment = Comment.new(comment_params)
    if @comment.save && @comment.commentable_type == "Question"
      redirect_to question_path(id: @comment.commentable_id)
    elsif @comment.save && @comment.commentable_type == "Answer"
      redirect_to question_path(id: Answer.find(@comment.commentable_id).question.id)
    else
      flash[:alert] = "We are sorry but your comment failed to save"
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type).merge(user_id: current_user.id)
  end

end
