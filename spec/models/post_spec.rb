require 'spec_helper'

describe Post do

  fixtures :streams

  describe '#draft?' do

    it "is true if the post has a date in the future" do
      expect(Post.new(date: Date.today + 1)).to be_draft
    end

    it "is false if the post is dated of today" do
      expect(Post.new(date: Date.today)).not_to be_draft
    end

    it "is false if the post has a date in the past" do
      expect(Post.new(date: Date.today - 1)).not_to be_draft
    end

  end

  describe "#create" do

    let(:post) { Post.new }

    before do
      post.create(
        category_name: "Book",
        title: "Lorem Ipsum",
        body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
        rating: 7
      )
    end

    it "creates a post" do
      expect(post).to be_persisted
    end

    it "assigns a default date" do
      expect(post.date).to be_present
    end

    it "assigns the post to a stream based on its category" do
      expect(post.stream.name).to eq("Read")
    end

  end

end
