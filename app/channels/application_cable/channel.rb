module ApplicationCable
  class Channel < ActionCable::Channel::Base
    delegate :silence, to: 'Rails.logger'
  end
end
