class UserChatStatus < ApplicationRecord
  # a users status is part of the user and the thread they are chatting in
  belongs_to :user
  belongs_to :current_thread, optional: true
  
  # expire a user if they haven't been active in some time
  def automatic_status
    case 
      when last_seen_at == nil           then :offline
      when last_seen_at > 10.minutes.ago then :available
      when last_seen_at > 60.minutes.ago then :away
      else :offline
    end       
  end
  
  # show the status manually or based on timeouts
  def status = manual_status ? manual_status.to_sym : automatic_status  
  
  # reuse the db updated column to tell if a user is online
  def last_seen_at = updated_at
end
