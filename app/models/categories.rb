module Categories

  MAP = {
    Category.new("Article")  => "Read",
    Category.new("Book")     => "Read",
    Category.new("Movie")    => "Watched",
    Category.new("Series")   => "Watched",
    Category.new("Video")    => "Watched",
    Category.new("Single")   => "Listened",
    Category.new("EP")       => "Listened",
    Category.new("Album")    => "Listened",
    Category.new("Mix")      => "Listened",
    Category.new("Podcast")  => "Listened",
    Category.new("Game")     => "Experienced",
    Category.new("Concert")  => "Experienced",
    Category.new("Gadget")   => "Experienced",
    Category.new("Place")    => "Experienced",
    Category.new("Food")     => "Experienced",
  }

  SLUG_INDEX   = MAP.keys.index_by { |category| category.slug }

  def self.list
    MAP.keys.sort
  end

  def self.find_by_slug!(slug)
    SLUG_INDEX.fetch(slug)
  end

  def self.stream_name_for(category)
    MAP.fetch(category)
  end

end