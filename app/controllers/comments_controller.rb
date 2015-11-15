class CommentsController < ApplicationController

  def create
    @questions = Question.all
    @comment = Comment.new(comment_params)
    if @comment.save && @comment.commentable_type == "Question"
      redirect_to questions_path
    elsif @comment.save && @comment.commentable_type == "Answer"
      redirect_to question_path(id: Answer.find(@comment.commentable_id).question.id)
    else
      flash.now[:alert] = "Comment can't be blank."
      render :"questions/index"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id )
  end

end
