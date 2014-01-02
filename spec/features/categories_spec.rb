require 'spec_helper'

describe "When I click on the category icon of a post" do

  fixtures :streams, :posts

  let(:post) { posts(:book1) }

  before do
    visit "/"
    all('.post a.category').first.click
  end

  it "shows the posts in this category" do
    expect(page).to have_css(".category-archive")
    expect(page).to have_content("Clojure")
  end

  it "shows a list of other categories" do
    expect(page).to have_css(".other-categories")
  end

end

describe "When I visit the categories page" do

  fixtures :streams, :posts

  let(:post) { posts(:book1) }

  before do
    visit "/categories"
  end

  it "shows a list of clickable categories" do
    expect(page).to have_css(".categories")
    expect(page).to have_content("Podcast")
    click_link("Book")
    expect(page).to have_content("Clojure")
  end


end

