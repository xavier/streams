require 'spec_helper'

describe Post do

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

end