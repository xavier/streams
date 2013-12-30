class Post < ActiveRecord::Base

  belongs_to :stream

  validates :stream, presence: true

  validates :title, presence: true
  validates :slug,  uniqueness: true

  validates :category, presence: true, inclusion: {in: Categories.list}

  validates :rating, numericality: {integer_only: true}, inclusion: {in: 0..10}

  scope :in_stream, ->(stream) { where(stream_id: stream) }
  scope :in_reverse_chronological_order, -> { order('created_at DESC') }

  def assign_slug
    self.slug = "#{SecureRandom.hex(8)}-#{self.title.parameterize}"
  end

  def self.write!(attributes)
    post = new(attributes)
    post.assign_slug
    post.stream = Stream.find_by!(name: Categories.stream_name_for(post.category))
    post.save!
    post
  end

end
