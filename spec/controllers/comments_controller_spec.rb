require 'rails_helper'
require 'pry'

describe CommentsController  do

  let(:comment_on_answer) { FactoryGirl.build(:answer_comment) }
  let(:comment_on_question) { FactoryGirl.build(:question_comment) }

  before(:each) do
    stub_current_user(FactoryGirl.create(:user))
  end

  context 'comment_params' do
    it 'returns the correct params hash when comment_params is called' do
      post :create, comment: {content: comment_on_answer.content, commentable_id: comment_on_answer.commentable_id, commentable_type: comment_on_answer.commentable_type, user_id: comment_on_answer.user_id}
      expect(assigns(:comment)).to be_a(Comment)
    end
    it 'redirects to the question path if a comment is saved on a question' do
      post :create, comment: {content: comment_on_question.content, commentable_id: comment_on_question.commentable_id, commentable_type: comment_on_question.commentable_type, user_id: comment_on_question.user_id}
      expect(response).to redirect_to questions_path
    end
  end

end
      # { content: comment_on_answer.content, commentable_id: comment_on_answer.commentable_id, commentable_type: comment_on_answer.commentable_type, user_id: comment_on_answer.user_id }
