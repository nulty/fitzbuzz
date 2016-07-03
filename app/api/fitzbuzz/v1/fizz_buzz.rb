module Fitzbuzz
  module V1
    class FizzBuzz < Grape::Entity
      format_with(:iso_timestamp, &:iso8601)
      expose :number
      expose :value

      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end
