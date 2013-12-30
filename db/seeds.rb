# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Read", "Listened", "Watched", "Experienced"].each_with_index do |name, idx|
  Stream.setup!(idx.succ, name)
end

[
  {category: "Book",  title: "Clojure Programming", body: "Convoluted examples", url: "http://shop.oreilly.com/product/0636920013754.do", rating: 6},
  {category: "Movie", title: "Pacific Rim", body: "The only difference between this and the knockoff produced by The Asylum is the budget.", rating: 2},
  {category: "Mix", title: "Heart Drive: 02 Empathy Reboot", body: "dBridge and Kid Drama deliver", rating: 8},
  {category: "Movie", title: "The Dirties", body: "Gus Van Sant meets 4chan", rating: 7},
  {category: "Game", title: "Limbo", body: "Mentally draining but fantastically eerie and gloomy", rating: 8},
  {category: "Game", title: "Shadowrun Returns", body: "Deliciously cyberpunk, despite the fantasy crap", rating: 7},
  {category: "EP", title: "Burial", body: "Back at the top of his game, arguably even better than Untrue", rating: 9},
  {category: "Album", title: "7 Days of Funk", body: "Snoopzilla & Dâm Funk in a exercise of style and nostalgia", rating: 8},
  {category: "Game", title: "F-Sim Space Shuttle", body: "A subtle balance between the zen-like experience of gliding and the adrenalin of a realistic landing", rating: 9, url: "http://f-sim.com"},
  {category: "Album", title: "Spaces", body: "Nils Frahm at the top of his game", rating: 10},
  {category: "Movie", title: "Gravity", body: "Holy shit", rating: 9, url: "http://www.imdb.com/title/tt1454468"},
  {category: "Movie", title: "2 Guns", body: "Generic, derivative, uninspired, useless.", rating: 3, url: "http://www.imdb.com/title/tt1272878/"},
  {category: "Book", title: "Curb Your Enthusiasm and Philosophy", body: "Fun read", rating: 8, url: "http://www.amazon.com/Curb-Your-Enthusiasm-Philosophy-Assassin/dp/0812697669"},
  {category: "Series", title: "Dream On", body: "I'm a sucker for everything early 90s New York. Dream On ain't no Seinfeld but it surely is always enjoyable.", rating: 7, url: "http://www.imdb.com/title/tt0098780"},
].each do |post_attributes|
  Post.write!(post_attributes)
end