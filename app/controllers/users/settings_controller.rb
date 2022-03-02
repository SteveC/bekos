class Users::SettingsController < ApplicationController
  require_authentication!

  def show
  end
  
  def update
    current_user.update! language_codes: params[:language_codes].reject(&:blank?)
    redirect_to chat_path
  end
end
