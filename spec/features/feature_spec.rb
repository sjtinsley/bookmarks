require "capybara/rspec"
require_relative "../../app"

Capybara.app = BookmarkManager

feature 'bookmarks' do
  before(:all) {
    empty_test_db
    insert_2_url
  }

  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "Testurl1"
    expect(page).to have_content "Testurl2"
  end

  scenario 'user can add a bookmark' do
    visit '/bookmarks'
    fill_in "add_url", with: "http://testurl3.org"
    fill_in "add_title", with: "Testurl3"
    click_button 'Submit'
    expect(page).to have_content "Testurl3"
  end
end
