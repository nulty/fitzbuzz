require 'rails_helper'

RSpec.describe UsersFizzBuzzsController, type: :controller do
  describe 'POST create' do
    let(:user) { User.create(username: 'username', password: 'password') }
    let(:fizzbuzz) { FizzBuzz.create(number: 5, value: 'buzz') }

    before { allow(controller).to receive(:current_user) { user } }

    it 'returns a success' do
      post :create, fizz_buzz_id: fizzbuzz.id
      expect(response).to redirect_to root_url
    end

    it 'creates a new fizzbuzz favourite' do
      expect do
        post :create, fizz_buzz_id: fizzbuzz.id
      end.to change { user.favourite_fizz_buzzs.count }.by(1)
    end
  end

  describe 'DELETE destroy' do
    let(:user) { User.create(username: 'username', password: 'password') }
    let(:fizz_buzz) { FizzBuzz.create(number: 5, value: 'buzz') }
    let!(:favourite) { user.favourite_fizz_buzzs.create(fizz_buzz_id: fizz_buzz.id) }

    before { allow(controller).to receive(:current_user) { user } }

    it 'returns http success' do
      delete :destroy, fizz_buzz_id: fizz_buzz.id
      expect(response).to redirect_to root_url
    end

    it 'destroys the favourite fixx_buzz' do
      expect do
        delete :destroy, fizz_buzz_id: fizz_buzz.id
      end.to change { user.favourite_fizz_buzzs.count }.by(-1)
    end

    it 'flash notice exists' do
      delete :destroy, fizz_buzz_id: fizz_buzz.id
      expect(flash.notice).to eq('Favourite destroyed')
    end
  end
end
