class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:users_id]) if session[:users_id]
  end

  helper_method :current_user, :logged_in?

  def logged_in?
  	redirect_to user_path(current_user) if current_user
  end
end
