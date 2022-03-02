class User < ApplicationRecord
  has_secure_password
  
  class << self
    def authenticate!(login, password)
      user = find_by!(login: login)
      user.authenticate(password) || raise(ActiveRecord::RecordNotFound)
    end    
  end
end
