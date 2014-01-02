module PostsHelper

  def post_rating(post)
    r = post.rating / 2
    ('●' * r) + ('◦' * (5-r))
  end

  def post_rating_tag(post)
    content_tag(:abbr, post_rating(post), title: "#{post.rating}/10")
  end

  def post_category(post)
    category_icon(post.category)
  end

  def post_permalink(post)
    link_to("#", post_path(post), class: "permalink")
  end

  def post_date(post)
    post.date.to_formatted_s(:long)
  end

end
