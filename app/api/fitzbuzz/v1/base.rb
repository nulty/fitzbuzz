module Fitzbuzz
  module V1
    class Base < Fitzbuzz::Api
      version 'v1', using: :path
      prefix :api

      get do
        { version: 'v1' }
      end

      add_swagger_documentation hide_format: true, api_version: 'api/v1'
    end
  end
end
