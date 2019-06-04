

feature 'Bookmark' do

  scenario 'links to bookmark url' do
    visit('/bookmarks')
    expect(page).to have_link(nil, href:'http://www.destroyallsoftward.com')
  end

  scenario 'Displays bookmarks title' do
    visit('/bookmarks')
    expect(page).to have_content "Destroy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Makers Academy"
  end

  scenario 'creates new bookmark' do 
    visit('/add-bookmark')
    fill_in 'url', with: 'http://nyan.cat'
    click_button 'Submit'
    expect(page).to have_link(nil, href:'http://nyan.cat')
  end 


  pending 'displays title' do 
    visit('/add-bookmark')
    fill_in 'url', with: 'http://nyan.cat'
    fill_in 'title', with: 'Nyan'
    click_button 'Submit'
    expect(page).to have_content 'Nyan'
  end

end
