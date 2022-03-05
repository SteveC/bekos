class User < ApplicationRecord
  # users can have many messages and a online status
  has_many :chat_messages, dependent: :delete_all
  has_one  :chat_status, class_name: 'UserChatStatus', dependent: :destroy
  
  # users need to be logged in with a good password
  has_secure_password
    
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # users may be interested in multiple languages
  def languages = @languages ||= Language.where(code: language_codes).order(:name)
  def full_name = "#{first_name} #{last_name}".strip

  def chat_status! = chat_status || create_chat_status

  # make sure user is authenticated across classes
  class << self
    def authenticate!(login, password)
      user = find_by!(login: login)
      user.authenticate(password) || raise(ActiveRecord::RecordNotFound)
    end    
  end
end
