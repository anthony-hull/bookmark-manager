
feature 'adds bookmark' do

  scenario 'creates new valid' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'http://nyan.cat'
    click_button 'Submit'
    expect(page).to have_link(nil, href: 'http://nyan.cat')
  end

  scenario 'creates invalid bookmark' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'boogaloo'
    click_button 'Submit'
    expect(page).to have_content('boogaloo is not a valid url')
  end

end