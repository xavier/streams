class StreamsController < ApplicationController

  def index
    @streams = Stream.list
  end

  def show
    @stream = Stream.find_by_slug(params[:id])
    @other_streams = Stream.others(@stream).list
  end

end
