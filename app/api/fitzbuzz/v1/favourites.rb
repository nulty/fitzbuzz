module Fitzbuzz
  module V1
    class Favourite < Grape::Entity
      format_with(:iso_timestamp, &:iso8601)
      expose :user, using: Fitzbuzz::V1::User
      expose :number
      expose :value

      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end
