require 'rails_helper'

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
    let(:user) {FactoryGirl.create :user}
    it 'gives an invalid alert if an invalid username or password is typed in' do
      post :create, user: user
      expect(flash[:alert]).to be_present
    end
    it 'gives an invalid alert if an invalid username or password is typed in' do
      post :create, user: user
      expect(response).to render_template("questions/index")
    end
  end
  # context 'destroy' do

  # end
end
