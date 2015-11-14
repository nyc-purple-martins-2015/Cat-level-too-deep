require 'rails_helper'

describe QuestionsController do
  context "#index" do
    it "assigns @questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end
    it "renders the question index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  context "#new" do
    it "assigns an empty Question object" do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end
    it "renders a mew question page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

 let(:question) { FactoryGirl.create(:question) }

  context "#show" do
    it "finds the correct question" do
      get :show, id: question.id
      expect(assigns(:question)).to eq(question)
    end
    it "renders the question page" do
      get :show, id: question.id
      expect(response).to render_template(:show, id: question.id)
    end
  end

  context "#create" do
    it "saves question with valid attributes" do
      expect{
        post :create, user_id: FactoryGirl.create(:user), question: FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)

    end
  end
end
