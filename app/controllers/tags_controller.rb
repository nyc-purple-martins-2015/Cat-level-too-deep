class TagsController < ApplicationController
  def index
    @tags = Tag.includes(:questions)
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
