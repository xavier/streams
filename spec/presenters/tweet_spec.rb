require 'spec_helper'

describe Tweet do

  fixtures :streams, :posts

  describe "#to_s" do

    let(:post)    { posts(:book1) }
    let(:message) { "Read: Clojure Programming ●●●◦◦ http://streams.example.com/p/#{post.id}" }

    it "renders a tweet-sized link to the post" do
      expect(Tweet.new(post).to_s).to eq(message)
    end

  end

end