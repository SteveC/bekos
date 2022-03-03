class Language < ApplicationRecord
  has_one :thread, foreign_key: 'language_code', class_name: 'ChatThread'
  
  def thread! = thread || create_thread
    
  class << self
    def [](code) = find_by(code: code)
  end
end
