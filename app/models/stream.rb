class Stream < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  scope :list, -> { order(:display_order) }
  scope :others, ->(stream) { where('id <> ?', stream) }

  def to_param
    slug
  end

  def self.find_by_slug!(slug)
    where(slug: slug).first!
  end

  def self.setup!(display_order, name)
    create!(
      display_order: display_order,
      name: name,
      slug: name.parameterize,
    )
  end

end
