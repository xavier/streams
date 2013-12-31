
require 'spec_helper'

describe "When I click on post permalink" do

  fixtures :streams, :posts

  let(:post) { posts(:book1) }

  before do
    visit "/"
    within "#post_#{post.id}" do
      click_link '#'
    end
  end

  it "shows the post" do
    expect(page).to have_content(post.body)
  end

end

