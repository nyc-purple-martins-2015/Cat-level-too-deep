require 'rails_helper'

describe AnswersController do

  let (:our_user) { FactoryGirl.create(:user) }
  let(:our_question) { FactoryGirl.create(:question) }
  let (:our_answer) { FactoryGirl.build(:answer) }

  context "#create" do

    it 'assigns question to the correct question' do
      stub_current_user(our_user)
      post :create, answer: our_answer.attributes, question_id: our_question.id
      expect(assigns(:question)).to eq our_question
    end

    it 'assigns @answer to a new answer with the appropriate values' do
      stub_current_user(our_user)
      post :create, answer: our_answer.attributes, question_id: our_question.id
      expect(assigns(:answer).response).to eq(our_answer.response)
      expect(assigns(:answer).question_id).to eq(our_question.id)
      expect(assigns(:answer).user_id).to eq(our_user.id)
    end
    it 'assigns @comment to a new comment' do
      stub_current_user(our_user)
      post :create, answer: our_answer.attributes, question_id: our_question.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end
    it 'redirects to the question path if the answer saves' do
      stub_current_user(our_user)
      post :create, answer: our_answer.attributes, question_id: our_question.id
      expect(response).to redirect_to question_path(our_question)
    end
    it 'alerts the user if the answer is not saved' do
      stub_current_user(our_user)
      bad_answer_attributes = our_answer.attributes
      bad_answer_attributes[:response] = ""
      post :create, answer: bad_answer_attributes, question_id: our_question.id
      expect(flash[:alert]).to eq("Response can't be blank and you must be logged in.")
    end
    it 'renders the show template for questions if the answer is not saved' do
      stub_current_user(our_user)
      bad_answer_attributes = our_answer.attributes
      bad_answer_attributes[:response] = ""
      post :create, answer: bad_answer_attributes, question_id: our_question.id
      expect(response).to render_template "questions/show"
    end
  end

end
