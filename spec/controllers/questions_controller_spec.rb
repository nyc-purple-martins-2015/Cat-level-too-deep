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




end
