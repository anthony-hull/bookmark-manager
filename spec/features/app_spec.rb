

feature 'Bookmark' do
  scenario 'links to bookmark url' do
    visit('/bookmarks')
    expect(page).to have_link(nil, href: 'http://www.destroyallsoftward.com')
  end

  scenario 'Displays bookmarks title' do
    visit('/bookmarks')
    expect(page).to have_content 'Destroy'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Makers Academy'
  end

  scenario 'deletes a link' do
    visit '/bookmarks'
    click_button 'Delete Google'
    expect(page).not_to have_link('Google')
  end

  scenario 'updates Google title' do
    visit '/bookmarks'
    click_button 'Update Google'
    fill_in 'title', with: 'Yahoo'
    click_button 'Submit'
    expect(page).to have_content('Yahoo')
  end
end
