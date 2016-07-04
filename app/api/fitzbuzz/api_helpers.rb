module Fitzbuzz
  module ApiHelpers
    extend Grape::API::Helpers

    params :pagination do
      optional :page, type: Integer, default: 1
      optional :per_page, type: Integer, default: 20
    end

    def permitted_params
      declared(params, include_missing: false)
    end

    def resource_error!(resource)
      error!({ error: user.errors.full_messages.join(', ') }, 422)
    end
  end
end
