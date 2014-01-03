class Category

  class Serializer

    def dump(category)
      category.name
    end

    def load(name)
      Category.new(name)
    end

  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def slug
    @slug ||= @name.parameterize
  end

  alias_method :to_param, :slug

  include Comparable

  def <=>(other)
    self.name <=> other.name
  end

  def ==(other)
    self.name == other.name
  end

  alias_method :eql?, :==

  def hash
    self.name.hash
  end

end