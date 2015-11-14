require 'rails_helper'
require 'pry'

describe SessionsController do

  context 'new' do
    it 'assigns @user to a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it 'renders the new session template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context 'create' do
    let(:user) { FactoryGirl.create :user }
    let(:logging_in_user) { User.create!(username: "Awesomo4000", password: "password", email: "Awesomo4000 @awesomo.com") }


    it 'gives an invalid alert if a session cannot be created' do
      post :create
      expect(flash[:alert]).to be_present
    end
    it 'renders the questions index template if a session cannot be created' do
      post :create
      expect(response).to render_template("questions/index")
    end

    it 'does not start a new session if an invalid password is typed in' do
      post :create, username: user.username, password: ""
      expect(flash[:alert]).to be_present
      expect(response).to render_template("questions/index")
    end
    it 'does not start a new session if an invalid username is typed in' do
      post :create, username: "", password: "password"
      expect(flash[:alert]).to be_present
      expect(response).to render_template("questions/index")
    end


    it 'sets the session correctly if a user logs in' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      expect(session[:user_id]).to eq(logging_in_user.id)
    end

    it 'sets a flash notice if a user logs in' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      expect(flash[:notice]).to be_present
    end

    it 'sets a flash notice if a user logs in' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      expect(response).to redirect_to root_path
    end
  end
  context 'destroy' do

    let(:logging_in_user) { User.create!(username: "Awesomo4000", password: "password", email: "Awesomo4000 @awesomo.com") }

    it 'clears the session' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      get :destroy
      expect(session[:user_id]).to eq(nil)
    end

    it 'clears the session' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      get :destroy
      expect(response).to redirect_to root_path
    end

  end
end
