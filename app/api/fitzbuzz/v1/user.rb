module Fitzbuzz
  module V1
    class User < Grape::Entity
      format_with(:iso_timestamp, &:iso8601)
      expose :username

      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end
