require 'bookmark' 

describe 'Bookmark' do 
  let(:bookmark) { Bookmark.new }
  

  it 'all method shows array of bookmark instances' do 
    bookmarks = Bookmark.url
    expect(bookmarks).to include 'http://www.makersacademy.com'
    expect(bookmarks).to include "http://google.com"
    expect(bookmarks).to include "http://www.destroyallsoftward.com"
  end 

  it 'all method shows array of bookmark instances' do 
    bookmarks = Bookmark.title
    expect(bookmarks).to include 'Makers Academy'
    expect(bookmarks).to include "Google"
    expect(bookmarks).to include "Destroy"
  end 

  it 'adds a new URL' do 
    Bookmark.add('http://nyan.cat')
    expect(Bookmark.url).to include 'http://nyan.cat'
  end 
end 