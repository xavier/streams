class CategoriesController < ApplicationController

  def index
    @categories = Categories.list
  end

  def show
    respond_to do |format|
      format.html do
        @category_archive = CategoryArchive.new(params[:id])
      end
      format.atom do
        @feed = FeedService.category_feed(params[:id])
        render 'streams/feed'
      end
    end
  end

end
