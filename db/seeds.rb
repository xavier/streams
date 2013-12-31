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
  {date: "2014-01-01", category: "Book",   title: "Clojure Programming", body: "The convoluted examples go hand in hand with the haze of academia surrounding the topic.", url: "http://shop.oreilly.com/product/0636920013754.do", rating: 6},
  {date: "2013-12-10", category: "Book",   title: "Understanding Computation", body: "A very fun bottom-up approach to the science of computation. Excellent companion to SICP.", url: "http://shop.oreilly.com/product/0636920025481.do", rating: 8},
  {date: "2013-12-29", category: "Movie",  title: "Pacific Rim", body: "The only difference between this and the knockoff produced by The Asylum is the budget.", rating: 1, url: "http://www.imdb.com/title/tt1663662"},
  {date: "2013-12-30", category: "Mix",    title: "Heart Drive: 02 Empathy Reboot", body: "dBridge and Kid Drama deliver", rating: 8, url: "http://heartdrive.co.uk/02-empathy-reboot"},
  {date: "2013-12-27", category: "Movie",  title: "The Dirties", body: "Gus Van Sant meets 4chan", rating: 7, url: "http://www.imdb.com/title/tt2334896/"},
  {date: "2013-12-29", category: "Game",   title: "Limbo", body: "Mentally draining but fantastically eerie and gloomy. An exercise in frustration.", rating: 8, url: "http://limbogame.org/"},
  {date: "2013-12-26", category: "Game",   title: "Shadowrun Returns", body: "Deliciously cyberpunk, despite the fantasy crap. Far from being bug-free though.", rating: 7, url: "http://harebrained-schemes.com/shadowrun/"},
  {date: "2013-12-25", category: "EP",     title: "Rival Dealer", body: "Burial back at the top of his game, arguably even better than Untrue", rating: 9, url: "http://www.hyperdub.net/releases/view/258/HDB080"},
  {date: "2013-12-12", category: "Album",  title: "7 Days of Funk", body: "Snoopzilla & Dâm Funk in a exercise of style and nostalgia", rating: 8, url: "http://www.stonesthrow.com/news/2013/10/7-days-of-funk"},
  {date: "2013-12-15", category: "Game",   title: "F-Sim Space Shuttle", body: "A subtle balance between the zen-like experience of gliding and the adrenalin of a realistic landing", rating: 9, url: "http://f-sim.com"},
  {date: "2013-10-28", category: "Album",  title: "Spaces", body: "Nils Frahm reaches another level. The quality of the material in this recording is outstanding", rating: 10, url: "http://www.erasedtapes.com/store/index/ERATP055"},
  {date: "2013-12-04", category: "Movie",  title: "Gravity", body: "Beatifully paced and visually stunning. A milestone movie which could have been perfect without some unnecessary sentimentalism.", rating: 9, url: "http://www.imdb.com/title/tt1454468"},
  {date: "2013-12-30", category: "Movie",  title: "2 Guns", body: "Generic, derivative, uninspired, useless.", rating: 3, url: "http://www.imdb.com/title/tt1272878/"},
  {date: "2013-12-01", category: "Book",   title: "Curb Your Enthusiasm and Philosophy", body: "Fun read for all social assassin wannabes out there.", rating: 8, url: "http://www.amazon.com/Curb-Your-Enthusiasm-Philosophy-Assassin/dp/0812697669"},
  {date: "2013-12-28", category: "Series", title: "Dream On", body: "I'm a sucker for everything early 90s New York. A Dream On rerun was long overdue. It ain't no Seinfeld but it surely is always enjoyable.", rating: 7, url: "http://www.imdb.com/title/tt0098780"},
  {date: "2013-05-04", category: "Place",  title: "Astoria, OR", body: "Gorgeous, friendly and peaceful. Added to my list of places to retire", rating: 9, url: "https://en.wikipedia.org/wiki/Astoria%2C_Oregon"},
  {date: "2013-12-15", category: "Game",   title: "Clumsy Ninja", body: "The cuteness factor and the ever-impressive physics engine largely make up for a repetitive gameplay and regular IAP nagging", rating: 8, url: "https://itunes.apple.com/us/app/clumsy-ninja/id561416817"},
  {date: "2013-12-20", category: "Movie",  title: "The To Do List", body: "Much needed attempt at feminizing a the usual coming of age comedy. Not always on the mark but... Aubrey Plaza!", rating: 5, url: "http://www.imdb.com/title/tt1758795/"},
  {date: "2013-12-20", category: "Movie",  title: "The Way Way Back", body: "Great casting for another lighthearted comedy/drama focusing on an outcast teen", rating: 6, url: "http://www.imdb.com/title/tt1727388"},
  {date: "2013-12-28", category: "Podcast", title: "How Did This Get Made?", body: "Really enjoying Paul Scheer and his buddies chat about weird movies. Check out the Cool as Ice episodes.", rating: 8, url: "http://www.earwolf.com/show/how-did-this-get-made/"},
].each do |post_attributes|
  Post.new.create(post_attributes)
end