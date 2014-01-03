module CategoriesHelper

  CATEGORIES_ICONS = {
    "Article"  => :file,
    "Book"     => :book,
    "Movie"    => :film,
    "Series"   => :film,
    "Video"    => 'facetime-video',
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

  def category_icon(category)
    icon_name = CATEGORIES_ICONS[category.name]
    glyphicon(icon_name) if icon_name
  end

end
