# frozen_string_literal: true

feature 'Feature Tests' do
  scenario 'Displays Hello World' do
    visit('/')
    expect(page).to have_content 'Hello World'
  end
end
