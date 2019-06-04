

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

  scenario 'creates new bookmark' do 
    visit('/add-bookmark')
    fill_in 'url', with: 'http://nyan.cat'
    click_button 'Submit'
    expect(page).to have_content 'http://nyan.cat'
  end 

end
