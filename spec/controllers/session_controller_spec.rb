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
  # context 'destroy' do

  # end
end
