class HomepageController < ApplicationController
  def show
    # @fizzbuzzs = FizzBuzz.fetch(number_params)
    @fizzbuzzs = FizzBuzz.all
  end

  private

  def number_params
    params.permit(:numbers)
  end
end
