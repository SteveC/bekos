class ApplicationController < ActionController::Base
  
  protected
  
  def current_user = authenticated? && User.find(session[:user_id])
  def authenticated? = session[:user_id].present?
  def require_authentication! = current_user || redirect_to(login_path)
end
