class Post < ActiveRecord::Base

  belongs_to :stream

  validates :stream, presence: true

  validates :title, presence: true
  validates :slug,  uniqueness: true

  validates :date,  presence: true

  serialize :category, Category::Serializer

  validates :category, presence: true, inclusion: {in: Categories.list}

  validates :rating, numericality: {integer_only: true}, inclusion: {in: 0..10}

  scope :in_stream, ->(stream) { where(stream_id: stream) }
  scope :published, -> { where('date <= ?', Date.today) }
  scope :drafts, -> { where('date > ?', Date.today) }
  scope :in_reverse_chronological_order, -> { order('date DESC') }
  scope :in_category, ->(category) { where(category: category) }

  def draft?
    self.date > Date.today
  end

  def to_param
    slug
  end

  def self.find_by_slug!(slug)
    where(slug: slug).first!
  end

  def assign_slug
    self.slug = "#{self.title.parameterize}-#{SecureRandom.hex(4)}"
  end

  def category_name=(name)
    self.category = Category.new(name)
  end

  def category_name
    self.category.try(:name)
  end

  def create(post_attributes)
    self.attributes = post_attributes
    self.assign_slug
    self.stream = Stream.find_by!(name: Categories.stream_name_for(self.category)) if self.category
    self.date ||= Date.today
    self.save
  end

  def modify(post_attributes)
    self.update_attributes(post_attributes)
  end

end
