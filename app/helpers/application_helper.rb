module ApplicationHelper

  def page_title(*parts)
    (parts.flatten + ["Xavier Defrang"]).join(" | ")
  end

  def glyphicon(name)
    content_tag(:span, nil, class: "glyphicon glyphicon-#{name}")
  end

end
