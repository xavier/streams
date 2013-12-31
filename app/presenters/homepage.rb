class Homepage

  POSTS_PER_STREAM = 15

  class StreamDecorator < SimpleDelegator

    def posts
      __getobj__.posts.published.in_reverse_chronological_order.limit(POSTS_PER_STREAM)
    end

    def has_more?
      count_more > 0
    end

    def count_more
      @count_more ||= __getobj__.posts.count - POSTS_PER_STREAM
    end

  end

  attr_reader :streams

  def initialize(streams)
    @streams = streams.map { |stream| Homepage::StreamDecorator.new(stream) }
  end

end