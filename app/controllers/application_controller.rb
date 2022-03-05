class ApplicationController < ActionController::Base
  
  protected
  
  # basic authentication methods to ensure user is logged in
  def current_user = @current_user ||= authenticated? && User.find(session[:user_id])
  def authenticated? = session[:user_id].present?
  def require_authentication! = current_user || redirect_to(login_path)
  def self.require_authentication! = before_action(:require_authentication!)
    
  helper_method :authenticated?, :current_user
end
