class MessagesController < ApplicationController
  require_authentication!

  def index
    @thread = if params[:language_id]
      language = Language.find(params[:language_id])
      language.thread!
    elsif params[:user_id]
      other_user = User.find(params[:user_id])
      Thread.with_users!(current_user, other_user)
    end
    
    @messages = @thread.messages.order(:created_at)
    
    render 'chat/show'
  end
end
