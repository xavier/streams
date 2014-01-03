require 'spec_helper'

describe "Creation of a post" do

  fixtures :streams, :users

  before do
    user = User.register!('test@example.com', 'topsecret')
    sign_in_as user, 'topsecret'
    visit new_post_path
    fill_in 'Date', :with => (Date.today + 5).to_s
    select 'Movie', :from => 'Category'
    fill_in 'Title', :with => 'Test Title'
    fill_in 'Body', :with => 'Test body'
    fill_in 'Rating', :with => '7'
    click_on 'Save Post'
  end

  it "works" do
    expect(page.body).to have_content('has been created')
    expect(page.body).to have_content('2 drafts')
    expect(page.body).to have_content('Test Title')
  end

end
