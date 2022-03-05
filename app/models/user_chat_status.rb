class UserChatStatus < ApplicationRecord
  belongs_to :user
  belongs_to :current_thread, optional: true
  
  def automatic_status
    case 
      when last_seen_at == nil           then :offline
      when last_seen_at > 10.minutes.ago then :available
      when last_seen_at > 60.minutes.ago then :away
      else :offline
    end       
  end
  
  def status = manual_status ? manual_status.to_sym : automatic_status  
  
  def last_seen_at = updated_at
end
