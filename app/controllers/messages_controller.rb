class MessagesController < ApplicationController
  require_authentication!
  skip_before_action :verify_authenticity_token

  def index
    @thread = if params[:language_id]
      language = Language.find(params[:language_id])
      language.thread!
    elsif params[:user_id]
      other_user = User.find(params[:user_id])
      Thread.with_users!(current_user, other_user)
    end
    
    @messages = @thread.messages.order(:created_at).includes(:user)
    @users = User.all.includes(:chat_status).to_a
    
    render 'chat/show'
  end
end
