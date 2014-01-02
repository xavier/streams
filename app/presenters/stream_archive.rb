class StreamArchive

  attr_reader :stream

  def initialize(stream)
    @stream = stream
  end

  def posts_by_year
    @posts_by_year ||= @stream.posts.published.in_reverse_chronological_order.group_by { |post| post.date.year }.to_a
  end

  def other_streams
    @other_streams ||= Stream.others(@stream).list
  end

end