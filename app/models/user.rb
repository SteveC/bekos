class User < ApplicationRecord
  has_many :chat_messages, dependent: :delete_all
  has_one  :chat_status, class_name: 'UserChatStatus', dependent: :destroy
  
  has_secure_password
    
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def languages = @languages ||= Language.where(code: language_codes).order(:name)
  def full_name = "#{first_name} #{last_name}".strip

  def chat_status! = chat_status || create_chat_status

  class << self
    def authenticate!(login, password)
      user = find_by!(login: login)
      user.authenticate(password) || raise(ActiveRecord::RecordNotFound)
    end    
  end
end
