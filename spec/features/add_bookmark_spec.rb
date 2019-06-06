
feature 'adds bookmark' do

  scenario 'creates new valid' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'http://nyan.cat'
    click_button 'Submit'
    expect(page).to have_link(nil, href: 'http://nyan.cat')
  end

  scenario 'displays title after adding' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'http://nyan.cat'
    fill_in 'title', with: 'Nyan'
    click_button 'Submit'
    expect(page).to have_content 'Nyan'
  end

  scenario 'creates invalid bookmark' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'boogaloo'
    fill_in 'title', with: 'boogaloo'
    click_button 'Submit'
    expect(page).to have_content('boogaloo is not a valid url')
  end

  scenario 'creates invalid bookmark and is not displayed' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'boogaloo'
    fill_in 'title', with: 'boogaloo'
    click_button 'Submit'
    visit('/bookmarks')
    expect(page).to_not have_content('boogaloo')
  end

end