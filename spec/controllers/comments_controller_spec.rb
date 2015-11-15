require 'rails_helper'
require 'pry'

describe CommentsController  do

  let(:comment_on_answer) { FactoryGirl.build(:answer_comment) }
  let(:comment_on_question) { FactoryGirl.build(:question_comment) }

  before(:each) do
    stub_current_user(FactoryGirl.create(:user))
  end

  context '#create' do
    it 'creates a new comment and assigns it to @comment' do
      post :create, comment: {content: comment_on_answer.content, commentable_id: comment_on_answer.commentable_id, commentable_type: comment_on_answer.commentable_type, user_id: comment_on_answer.user_id}
      expect(assigns(:comment)).to be_a(Comment)
    end
    it 'creates a new comment and assigns it to @comment' do
      post :create, comment: {content: comment_on_question.content, commentable_id: comment_on_question.commentable_id, commentable_type: comment_on_question.commentable_type, user_id: comment_on_question.user_id}
      expect(assigns(:comment)).to be_a(Comment)
    end
    it 'redirects to the question path if a comment on a question is saved' do
      post :create, comment: {content: comment_on_question.content, commentable_id: comment_on_question.commentable_id, commentable_type: comment_on_question.commentable_type, user_id: comment_on_question.user_id}
      expect(response).to redirect_to question_path(comment_on_question.commentable)
    end
    it 'redirects to the question path if a comment on an answer is saved' do
      post :create, comment: {content: comment_on_answer.content, commentable_id: comment_on_answer.commentable_id, commentable_type: comment_on_answer.commentable_type, user_id: comment_on_answer.user_id}
      expect(response).to redirect_to question_path(comment_on_answer.commentable.question.id)
    end
    it 'redirects to root page if the comment is not saved and alerts the user' do
      stub_current_user(FactoryGirl.create(:user))
      post :create, comment: {content: "", commentable_id: 1, commentable_type: "", user_id: 1}
      expect(flash[:alert]).to eq("We are sorry but your comment failed to save, you probably aren't logged in or are submitting an empty comment!")
      expect(response).to redirect_to(root_path)
    end
  end
end
