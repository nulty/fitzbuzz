class FizzBuzz < ActiveRecord::Base
  require 'fizzbuzz_script'
  FizzBuzz::LIMIT = 1_000_000_000

  has_many :users_fizz_buzzs
  has_many :users, through: :users_fizz_buzzs

  def self.select_or_create_by_numbers(numbers)
    numbers = Array(numbers)
    existing = where(number: numbers)
    return existing if existing.count == numbers.count

    non_existing_numbers = (numbers - existing.pluck(:number))

    attributes = non_existing_numbers.map do |n|
      { number: n, value: FizzbuzzScript.call(n) }
    end

    create!(attributes)

    where(number: numbers)
  end
end
