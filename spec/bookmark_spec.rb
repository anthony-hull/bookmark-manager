require 'bookmark' 

describe 'Bookmark' do 
  let(:bookmark) { Bookmark.new }
  before(:each) { prep_test_db }

  it 'all method shows array of bookmark instances' do 
    bookmarks = Bookmark.all
    expect(bookmarks).to include 'http://www.makersacademy.com'
    expect(bookmarks).to include "http://google.com"
    expect(bookmarks).to include "http://www.destroyallsoftward.com"
  end 
end 