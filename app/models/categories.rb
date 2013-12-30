module Categories

  MAP = {
    "Article" => "Read",
    "Book"    => "Read",
    "Movie"   => "Watched",
    "Series"  => "Watched",
    "Video"   => "Watched",
    "Single"  => "Listened",
    "EP"      => "Listened",
    "Album"   => "Listened",
    "Mix"     => "Listened",
    "Podcast" => "Listened",
    "Game"    => "Experienced",
    "Concert" => "Experienced",
    "Gadget"  => "Experienced",
  }

  def self.list
    MAP.keys.sort
  end

  def self.stream_name_for(category)
    MAP.fetch(category)
  end

end