# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def with_lack_attension(value, lack_attension)
    return h(value) if value && (!value.kind_of?(String) || !value.blank?)
    content_tag(:span, h(lack_attension), :class => "lackAttension")
  end
end
