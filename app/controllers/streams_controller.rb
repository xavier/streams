class StreamsController < ApplicationController

  def index
    respond_to do |format|
      format.html do
        @homepage = Homepage.new(Stream.list)
      end
      format.atom do
        @feed = FeedService.main_feed
        render 'feed'
      end
    end
  end

  def show
    @stream = Stream.find_by_slug(params[:id])
    respond_to do |format|
      format.html do
        @other_streams = Stream.others(@stream).list
        @stream_posts_by_year = @stream.posts.in_reverse_chronological_order.group_by { |post| post.date.year }.to_a
      end
      format.atom do
        @feed = FeedService.stream_feed(@stream)
        render 'feed'
      end
    end

  end

end
