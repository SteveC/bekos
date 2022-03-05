class Language < ApplicationRecord
  # there are many languages which each have a thread and a language code like en for English
  has_one :thread, foreign_key: 'language_code', class_name: 'ChatThread'
  
  def thread! = thread || create_thread
    
  class << self
    def [](code) = find_by(code: code)
  end
end
