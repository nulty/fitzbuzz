require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST create' do
    context 'correct login details' do
      let(:username) { 'username' }
      let(:password) { 'password' }

      let!(:user) { User.create(username: username, password: password) }
      it 'returns http success' do
        post :create, session: { username: username, password: password }
        expect(response).to redirect_to root_url
        expect(session).to include(['user_id', user.id])
        expect(flash).to include(['notice', 'You\'re logged in'])
      end
    end

    context 'incorrect login details' do
      let(:username) { 'username' }
      let(:password) { 'password' }

      it 'redirect_to root url' do
        post :create, session: { username: username, password: password }
        expect(response).to redirect_to root_url
      end

      it 'sets the error flash' do
        post :create, session: { username: username, password: password }
        expect(flash[:error]).to eq('Usernmae or password is incorrect')
      end
    end
  end

  describe 'POST destroy' do
    let!(:user) { User.create(username: 'username', password: 'password') }

    before do
      controller.session[:user_id] = user.id
    end

    it 'destroys the session' do
      delete :destroy
      expect(session).not_to have_key('user_id')
    end

    it 'redirects back to root_url' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
