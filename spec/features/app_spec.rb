
require 'bookmark'

feature 'Bookmark' do
  scenario 'Displays bookmarks title' do
    visit('/bookmarks')
    expect(page).to have_title 'Bookmarks'
  end

  scenario 'Displays bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.bbc.co.uk'
    expect(page).to have_content 'www.bing.com'
  end

end
