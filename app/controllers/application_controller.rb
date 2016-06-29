class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_login, unless: :logged_in?
  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id].present?
  end

  def set_login
    @session_form = SessionForm.new(User.new)
  end
end
