module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ws:#{current_user.login}"
    end
    
    private
    
    def find_verified_user
      session = cookies.encrypted[Rails.application.config.session_options[:key]]
      User.find(session['user_id']) || reject_unauthorized_connection
    end    
  end
end
