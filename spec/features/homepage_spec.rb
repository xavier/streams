
require 'spec_helper'

describe "The homepage" do

  fixtures :streams, :posts

  before do
    visit "/"
  end

  [:read, :listened, :watched, :experienced].each do |stream_slug|

    it "shows the '#{stream_slug}' stream" do
      expect(page).to have_css(".stream.stream-#{stream_slug}")
    end

  end

  it "does not show posts with a date in the future" do
    expect(page).not_to have_content("Book in the Future")
  end

end

