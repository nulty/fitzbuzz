class UsersController < ApplicationController
  def new
    @user_form = UserCreateForm.new(User.new)
  end

  def create
    @user_form = UserCreateForm.new(User.new)

    if valid_form?
      @user_form.save

      flash[:notice] = 'Welcome to the app!'
      return render js: "window.location='#{root_url}'"
    end
  end

  private

  def valid_form?
    @user_form.validate(params[:user])
  end
end
