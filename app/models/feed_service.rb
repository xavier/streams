class FeedService

  DEFAULT_LIMIT = 15

  TITLE_FORMAT = "%s | Xavier Defrang"

  def self.main_feed(limit = DEFAULT_LIMIT)
    Feed.new(feed_title("Streams"), posts_in_feed(Post, limit))
  end

  def self.stream_feed(stream, limit = DEFAULT_LIMIT)
    Feed.new(feed_title(stream.name), posts_in_feed(Post.in_stream(stream), limit))
  end

  def self.category_feed(category, limit = DEFAULT_LIMIT)
    Feed.new(feed_title(category), posts_in_feed(Post.in_category(category), limit))
  end

  private

  def self.feed_title(title)
    sprintf(TITLE_FORMAT, title)
  end

  def self.posts_in_feed(scope, limit)
    scope.published.in_reverse_chronological_order.limit(limit)
  end

end