class CategoryArchive

  attr_reader :category

  def initialize(category)
    @category = category
  end

  def category_name
    @category.name
  end

  def posts_by_year
    @posts_by_year ||= Post.in_category(@category).published.in_reverse_chronological_order.group_by { |post| post.date.year }.to_a
  end

  def other_categories
    @other_categories ||= (Categories.list - [@category])
  end

end