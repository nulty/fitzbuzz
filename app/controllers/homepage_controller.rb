class HomepageController < ApplicationController
  def show
    # @fizzbuzzs = FizzBuzz.fetch(number_params)
    @fizzbuzzs = FizzBuzz.paginate(page: params[:page], per_page: params[:per_page])
  end

  private

  def number_params
    params.permit(:numbers, :page, :per_page)
  end
end
