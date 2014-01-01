require 'spec_helper'

describe "When I click on post permalink" do

  fixtures :streams, :posts

  let(:post) { posts(:book1) }
  let(:shortened_url) { "/p/#{post.id}" }

  it "redirects to the post page" do
    visit shortened_url
    expect(page.current_path).to eq(post_path(post))
  end

  it "shows the post" do
    visit shortened_url
    expect(page).to have_content(post.body)
  end

end

