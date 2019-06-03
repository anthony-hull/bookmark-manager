# frozen_string_literal: true

feature 'Feature Tests' do
  scenario 'Displays Hello World' do
    visit('/bookmarks')
    expect(page).to have_title 'Bookmarks'
  end

end
