class ChatMessage < ApplicationRecord
  belongs_to :thread, class_name: 'ChatThread'
  belongs_to :user
end
