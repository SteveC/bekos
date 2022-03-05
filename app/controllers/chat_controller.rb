class ChatController < ApplicationController
  # make sure the user is logged in
  require_authentication!
  
  # redirect to the correct page
  def show
    redirect_to language_messages_path(current_user.languages.to_a.first&.code || 'en')
  end
end
