

feature 'Bookmark' do
  scenario 'Displays bookmarks title' do
    visit('/bookmarks')
    expect(page).to have_title 'Bookmarks'
  end

  scenario 'Displays bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.destroyallsoftward.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://www.makersacademy.com"
  end

end
