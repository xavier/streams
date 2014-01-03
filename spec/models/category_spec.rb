require 'spec_helper'

describe Category do

  describe "#slug" do

    it "is a URL friendly string" do
      expect(Category.new("Lorem Ipsum").slug).to eq("lorem-ipsum")
    end

  end

  it "is comparable for equality" do
    expect(Category.new("ABC")).to eq(Category.new("ABC"))
  end

  it "is comparable for inequality" do
    expect(Category.new("ABC")).not_to eq(Category.new("XYZ"))
  end

  it "is comparable" do
    expect(Category.new("ABC")).to be < Category.new("XYZ")
  end

  describe "#hash" do

    it "is the same if the name is the same" do
      expect(Category.new("ABC").hash).to eq(Category.new("ABC").hash)
    end

    it "is different if the name is different" do
      expect(Category.new("ABC").hash).not_to eq(Category.new("XYZ").hash)
    end

    it "allows hash lookups to work as expected" do
      hash = {
        Category.new("ABC") => "it works!"
      }
      expect(hash[Category.new("ABC")]).to eq("it works!")
    end
  end

end