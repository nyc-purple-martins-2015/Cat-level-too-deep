class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save && @comment.commentable_type == "Question"
      redirect_to questions_path
    elsif @comment.save && @comment.commentable_type == "Answer"
      redirect_to question_path(id: Answer.find(@comment.commentable_id).question.id)
    else
      #add error message
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id )
  end

end
