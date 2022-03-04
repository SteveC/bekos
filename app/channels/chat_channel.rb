class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def sync
  end
  
  class << self
    def push(reason = 'updated')
      ActionCable.server.broadcast 'chat', { reason: reason }
    end
  end  
end
