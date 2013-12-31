class Feed

  attr_reader :title
  attr_reader :posts

  def initialize(title, posts)
    @title = title
    @posts = posts
  end

  def empty?
    @posts.empty?
  end

  def last_update
    @posts.first.created_at
  end

end