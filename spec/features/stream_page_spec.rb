
require 'spec_helper'

describe "A stream page" do

  fixtures :streams, :posts

  before do
    visit "/streams/read"
  end

  it "shows the stream contents" do
    expect(page).to have_content("Understanding Computation")
  end

  it "does not show contents form other streams" do
    expect(page).not_to have_content("Gravity")
  end

  it "shows a list of links to the other available streams" do
    within ".other-streams" do
      expect(page).to have_content("Watched")
      expect(page).not_to have_content("Read")
    end
  end

  context "when I click on another stream" do

    before do
      within ".other-streams" do
        click_link "Watched"
      end
    end

    it "shows the other stream contents" do
      expect(page).to have_content("Gravity")
    end

  end

end

