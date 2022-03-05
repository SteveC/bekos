class SessionsController < ApplicationController
  # manage user sessions
  
  def show
  end
  
  # create a new session
  def create
    @user = User.authenticate!(params[:login], params[:password])
    session[:user_id] = @user.id
    redirect_to chat_path
    
  rescue ActiveRecord::RecordNotFound
    flash.now.alert = "Wrong login or password."
    render :show
  end
  
  # remove a session (basically, log out)
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
