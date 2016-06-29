require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST create' do
    describe 'User exists' do
      let(:attributes) { { username: 'username', password: 'password' } }
      before { User.create!(attributes) }

      context 'Creates the user`' do
        before do
          xhr :post, :create, user: attributes
        end

        it 'redirects to homepage' do
          expect(response).to be_success
        end

        it 'sends flash notice' do
          expect(flash['notice']).to eq('Welcome!')
        end
      end

      context 'Fails to create the user`' do
        let(:attributes) { { username: '', password: 'password' } }

        before do
          xhr :post, :create, user: attributes
        end

        it 'redirects to homepage' do
          expect(response).to render_template :create
        end
      end
    end
  end
end
