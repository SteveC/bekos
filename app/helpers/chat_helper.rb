module ChatHelper
  ChatStatusClasses = {
    available: 'text-success',
    away:      'text-warning',
    offline:   'text-muted',
  }
  
  def chat_status_for_user(status)
    ChatStatusClasses[status || :offline]
  end
end
