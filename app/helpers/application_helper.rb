module ApplicationHelper

  def flash_messages
    [:notice, :alert].map{|type| flash_message(type)}.join
  end

  def flash_message(type)
    content_tag(:div, :class => type) do
      link_to_function flash[type], '$(this).up().remove()'
    end if flash[type]
  end

end
