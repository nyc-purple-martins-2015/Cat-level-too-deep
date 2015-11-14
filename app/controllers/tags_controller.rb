class TagsController < ApplicationController
  def index
    @tags = Tag.includes(:questions)
  end

  def show
    @tag = Tag.find(params[:id])
  end

  # def new
  #   @tag = Tag.new
  #   render :new
  # end

  # def create
  #   @question = find(params[:question_id])
  #   @question.tags << find_or_create_by
  #   @question.tags.new(tag_params)
  #   if @question.save
  #     redirect_to question_path(@question)
  #   else
  #     render :new
  #   end
  # end

  # private

  # def tag_params
  #   params.require(:tag).permit(:category, :question_id )
  # end
end