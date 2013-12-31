class StreamsController < ApplicationController

  def index
    @streams = Stream.list
  end

  def show
    @stream = Stream.find_by_slug(params[:id])
    @other_streams = Stream.others(@stream).list
    @stream_posts_by_year = @stream.posts.in_reverse_chronological_order.group_by { |post| post.date.year }.to_a
  end

end
