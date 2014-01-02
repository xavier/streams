class CategoriesController < ApplicationController

  def index
    @categories = Categories.list
  end

  def show
    @category_archive = CategoryArchive.new(params[:id])
  end

end
