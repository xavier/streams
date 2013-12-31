module ApplicationHelper

  def glyphicon(name)
    content_tag(:span, nil, class: "glyphicon glyphicon-#{name}")
  end

end
