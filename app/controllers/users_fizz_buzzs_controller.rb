class UsersFizzBuzzsController < ApplicationController
  def create
    current_user.favourite_fizz_buzzs.create(fizz_buzz_id: params[:fizz_buzz_id])

    redirect_to root_url, flash: { notice: 'Favourite created' }
  end

  def destroy
    current_user.favourite_fizz_buzzs.find_by(fizz_buzz_id: params[:fizz_buzz_id]).destroy

    redirect_to root_url, flash: { notice: 'Favourite destroyed' }
  end
end
