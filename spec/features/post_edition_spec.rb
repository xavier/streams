require 'spec_helper'

describe "Edition of a post" do

  fixtures :streams, :users, :posts

  let(:post) { posts(:book1) }

  before do
    user = User.register!('test@example.com', 'topsecret')
    sign_in_as user, 'topsecret'
    visit edit_post_path(post)
    fill_in 'Title', :with => 'New Title'
    click_on 'Save Post'
  end

  it "works" do
    expect(page.body).to have_content('has been updated')
    expect(page.body).to have_content('New Title')
  end

end
