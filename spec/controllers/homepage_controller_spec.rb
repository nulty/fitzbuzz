require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe 'GET show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show
      expect(response).to have_rendered(:show)
    end

    describe 'pagination' do
      it 'creates new FizzBuzz when they don\'t exists' do
        expect do
          get :show, per_page: 5, page: 10
        end.to change { FizzBuzz.count }.by(5)
      end

      describe '?per_page=' do
        it 'defaults to 100' do
          get :show, page: 10
          expect(session).not_to have_key(:per_page)
        end

        it 'param updates the sessions per_page' do
          get :show, per_page: 25, page: 10
          expect(session[:per_page]).to eq('25')
        end
      end
    end
  end
end
