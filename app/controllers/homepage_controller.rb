class HomepageController < ApplicationController
  def show
    @fizzbuzzs = FizzBuzz.paginate(pagination_options)
    prepare_fizzbuzzs
  end

  private

  def number_params
    params.permit(:numbers, :page, :per_page)
  end

  def prepare_fizzbuzzs
    arel = @fizzbuzzs.arel
    from_number = arel.offset.next
    to_number = (arel.offset + arel.limit)

    FizzBuzz.select_or_create_by_numbers((from_number..to_number).to_a)

    @fizzbuzzs = FizzBuzz.where(number: (from_number..to_number)).paginate(pagination_options).offset(0)
  end

  def pagination_options
    {
      total_entries: FizzBuzz::LIMIT,
      page: params[:page],
      per_page: params[:per_page] || 100
    }
  end
end
