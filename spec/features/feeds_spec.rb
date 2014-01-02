
require 'spec_helper'

describe "Atom feeds" do

  fixtures :streams, :posts

  describe "main feed" do

    let(:feed) do
      visit streams_path(format: 'atom')
      Feedzirra::Feed.parse(page.body)
    end

    it "has entries" do
      expect(feed.entries).not_to be_empty
    end

  end

  describe "stream feed" do

    let(:stream) { streams(:read) }

    let(:feed) do
      visit stream_path(stream, format: 'atom')
      Feedzirra::Feed.parse(page.body)
    end

    it "has the stream name in the title" do
      expect(feed.title).to include(stream.name)
    end

    it "has entries" do
      expect(feed.entries).not_to be_empty
    end

  end

  describe "category feed" do

    let(:category) { "Book" }

    let(:feed) do
      visit category_path(category, format: 'atom')
      Feedzirra::Feed.parse(page.body)
    end

    it "has the stream name in the title" do
      expect(feed.title).to include(category)
    end

    it "has entries" do
      expect(feed.entries).not_to be_empty
    end

  end
end

