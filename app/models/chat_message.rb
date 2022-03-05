class ChatMessage < ApplicationRecord
  # each message belongs to a user and a thread
  belongs_to :thread, class_name: 'ChatThread'
  belongs_to :user
end
