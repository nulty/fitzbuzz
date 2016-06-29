class SessionsController < ApplicationController
  def create
    @session_form = SessionForm.new(User.new)

    return redirect_root_error unless valid_form? && fetch_user

    if authenticated?
      login_user
      redirect_to root_url, flash: { notice: "You're logged in" }
    else
      redirect_to root_url, flash: { error: 'Login Failed' }
    end
  end

  def destroy
    logout_user
    redirect_to root_url
  end

  private

  def logout_user
    session.delete(:user_id)
  end

  def login_user
    session[:user_id] = @user.id
  end

  def fetch_user
    @user = User.find_by(username: @session_form.username)
  end

  def authenticated?
    @user.authenticate(@session_form.password)
  end

  def valid_form?
    @session_form.validate(params[:session])
  end

  def redirect_root_error
    redirect_to root_url, flash: { error: 'Usernmae or password is incorrect' }
  end
end
