module ApplicationHelper
  def flash_alert
    tag.div flash.alert, class: 'alert alert-danger' if flash.alert
  end
end
