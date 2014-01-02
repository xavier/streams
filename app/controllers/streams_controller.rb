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
        @stream_archive = StreamArchive.new(@stream)
      end
      format.atom do
        @feed = FeedService.stream_feed(@stream)
        render 'feed'
      end
    end

  end

end
