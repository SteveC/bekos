class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  class << self
    def authenticate!(login, password)
      user = find_by!(login: login)
      user.authenticate(password) || raise(ActiveRecord::RecordNotFound)
    end    
  end
end
