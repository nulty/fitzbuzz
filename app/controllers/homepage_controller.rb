class HomepageController < ApplicationController
  def show
    # @fizzbuzzs = FizzBuzz.fetch(number_params)
    @fizzbuzzs = FizzBuzz.paginate(page: params[:page], per_page: params[:per_page])

    # allow the pagination Next button to be available despite the next entries
    # not actually existing
    @fizzbuzzs.total_entries = FizzBuzz::LIMIT
  end

  private

  def number_params
    params.permit(:numbers, :page, :per_page)
  end
end
