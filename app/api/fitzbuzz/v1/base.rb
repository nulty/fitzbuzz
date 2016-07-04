module Fitzbuzz
  module V1
    class Base < Fitzbuzz::Api
      version 'v1', using: :path
      format :json
      prefix :api

      get do
        { version: 'v1' }
      end

      resource :fizzbuzzs do
        get '/' do
          per_page = (params[:per_page] || WillPaginate.per_page).to_i
          page = (params[:page] || 0).to_i
          page -= 1

          lower = (per_page*page)
          higher = (per_page*page) + per_page
          numbers = (lower..higher)

          fizzbuzzs = ::FizzBuzz.select_or_create_by_numbers(numbers)

          present fizzbuzzs, with: Fitzbuzz::V1::FizzBuzz
        end

        get '/:number' do
          fizzbuzz = ::FizzBuzz.find_by(number: params[:number])

          present fizzbuzz, with: Fitzbuzz::V1::FizzBuzz
        end
      end

      resource :users do
        get '/' do
          per_page = (params[:per_page] || WillPaginate.per_page).to_i
          page = (params[:page] || 1).to_i

          users = ::User.paginate(page: page, per_page: per_page)

          present users, with: Fitzbuzz::V1::User
        end

        get '/:username' do
          user = ::User.find_by(username: params[:username])

          present user, with: Fitzbuzz::V1::User
        end
      end

      resource :favourites do
        get '/:username' do
          user = ::User.find_by(username: params[:username])
          favourites = user.fizz_buzzs
          present favourites, with: Fitzbuzz::V1::FizzBuzz
        end
      end

      add_swagger_documentation hide_format: true, api_version: 'api/v1'
    end
  end
end
