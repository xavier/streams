class CategoriesController < ApplicationController

  def index
    @categories = Categories.list
  end

  def show
    category = Categories.find_by_slug!(params[:id])
    respond_to do |format|
      format.html do
        @category_archive = CategoryArchive.new(category)
      end
      format.atom do
        @feed = FeedService.category_feed(category)
        render 'streams/feed'
      end
    end
  end

end
