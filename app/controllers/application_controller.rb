class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    session[:user_id] = current_user.id
    session[:balance] = current_user.balance
    user_path(resource)
  end
end
