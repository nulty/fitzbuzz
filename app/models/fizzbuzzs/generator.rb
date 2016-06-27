require 'fizzbuzz_script'

module Fizzbuzzs
  class Generator
    CHUNK = 2_000

    def self.generate(n = 1_000_000_000)
      1.upto(n).each_slice(CHUNK) do |batch|
        params = generate_params(batch)

        FizzBuzz.create(params)
      end
    end

    def self.generate_params(batch)
      batch.map do |number|
        params = empty_params

        params[:value] = FizzbuzzScript.call(number)
        params[:number] = number

        params
      end
    end

    private_class_method

    def self.empty_params
      { value: nil, number: nil }
    end
  end
end
