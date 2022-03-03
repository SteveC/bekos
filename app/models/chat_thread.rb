class ChatThread < ApplicationRecord
  belongs_to :language, foreign_key: 'language_code', optional: true
  has_many :messages, foreign_key: 'thread_id', class_name: 'ChatMessage'
  
  scope :with_users, -> user_1, user_2 { where "user_ids @> array[?]::bigint[]", [user_1, user_2] }
  
  class << self
    def with_users!(user_1, user_2) = with_users(user_1, user_2) || create!(user_ids: [user_1, user_2])
  end
end
