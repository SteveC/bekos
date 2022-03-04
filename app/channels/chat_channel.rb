class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:#{params[:thread_id]}"
  end

  def post(data)
    @thread = ChatThread.find(params[:thread_id])
    @message = @thread.messages.create! user: current_user, text: data['text'].to_s.strip
    ChatChannel.push_new_message @message
  end
  
  class << self
    def push_new_message(message)
      html = ApplicationController.render partial: 'messages/message', locals: { message: message }
      ActionCable.server.broadcast "chat:#{message.thread_id}", { html: html }
    end
  end  
end
