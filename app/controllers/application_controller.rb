class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    session.include?(:user_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
