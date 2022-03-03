class ChatController < ApplicationController
  require_authentication!
  
  def show
    redirect_to language_messages_path(current_user.languages.to_a.first&.code || 'en')
  end
end
