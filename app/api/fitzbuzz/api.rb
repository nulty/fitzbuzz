module Fitzbuzz
  class Api < Grape::API
    include Grape::Kaminari

    content_type :json, 'application/json;charset=UTF-8'
    format :json

    helpers Fitzbuzz::ApiHelpers

    rescue_from ActiveRecord::RecordNotFound do
      error!({ error: '404 Not found.' }, 404)
    end

    if Rails.env.production?
      rescue_from :all do |e|
        Rails.logger.error e.message + '\n ' + e.backtrace.join('\n ')
        error!({ error: '500 Internal server error.' }, 500)
      end
    end
  end
end
