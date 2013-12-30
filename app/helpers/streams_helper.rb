module StreamsHelper

  def star_rating(post)
    r = post.rating / 2
    content_tag(:abbr, ('★' * r) + ('☆' * (5-r)), title: "#{post.rating}/10")
  end

end
