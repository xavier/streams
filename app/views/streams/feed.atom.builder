atom_feed do |feed|
  feed.title(@feed.title)
  feed.updated(@feed.last_update) unless @feed.empty?
  @feed.posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(render(partial: "posts/post.html", object: post), type: 'html')
    end
  end
end