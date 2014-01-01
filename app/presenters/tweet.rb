class Tweet

  include PostsHelper
  include Rails.application.routes.url_helpers

  def initialize(post)
    @post = post
  end

  def url
    shortened_post_url(@post.id, host: Settings.default_host)
  end

  def to_s
    "#{@post.stream.name}: #{@post.title} #{post_rating(@post)} #{url}"
  end

end