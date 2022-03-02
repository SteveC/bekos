class SignupsController < ApplicationController
  def show
  end
  
  def create
    @user = User.create! login: params[:login], password: params[:password]
    session[:user_id] = @user.id
    flash.notice = "Thank you for sign up!"
    redirect_to chat_path

  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :show    
  end
end
