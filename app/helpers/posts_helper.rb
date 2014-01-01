module PostsHelper

  def post_rating(post)
    r = post.rating / 2
    ('●' * r) + ('◦' * (5-r))
  end

  def post_rating_tag(post)
    content_tag(:abbr, post_rating(post), title: "#{post.rating}/10")
  end

  POST_CATEGORIES_ICONS = {
    "Article"  => :file,
    "Book"     => :book,
    "Movie"    => :film,
    "Series"   => :film,
    "Video"    => :video,
    "Single"   => :music,
    "EP"       => :music,
    "Album"    => :music,
    "Mix"      => :headphones,
    "Podcast"  => :headphones,
    "Game"     => :send,
    "Concert"  => :music,
    "Gadget"   => :phone,
    "Place"    => "map-marker",
    "Food"     => :cutlery,
  }

  def post_category(post)
    icon_name = POST_CATEGORIES_ICONS[post.category]
    glyphicon(icon_name) if icon_name
  end

  def post_permalink(post)
    link_to("#", post_path(post), class: "permalink")
  end

  def post_date(post)
    post.date.to_formatted_s(:long)
  end

end
