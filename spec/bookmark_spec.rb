require 'bookmark' 

describe 'Bookmark' do 
  let(:bookmark) { Bookmark.new }
  

  it 'adds a new bookmark with title and url' do 
    Bookmark.add('http://nyan.cat', 'Nyan')
    bookmarks = Bookmark.all
    expect(bookmarks[3].url).to eq 'http://nyan.cat'
    expect(bookmarks[3].title).to eq 'Nyan'
  end 

  it 'return array of instances of self' do 
    bookmarks = Bookmark.all
    expect(bookmarks.first).to be_an_instance_of(Bookmark)
  end 

  it 'returns array of bookamrk objects, can view title' do 
    bookmarks = Bookmark.all
    expect(bookmarks[0].title).to eq('Makers Academy')
    expect(bookmarks[1].title).to eq('Destroy')
    expect(bookmarks[2].title).to eq('Google')

  end 
  it 'returns array of bookamrk objects, can view url' do
    bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq("http://www.makersacademy.com")
      expect(bookmarks[1].url).to eq("http://www.destroyallsoftward.com")
      expect(bookmarks[2].url).to eq("http://google.com")
  end

  it 'deletes a bookmark' do 
    Bookmark.delete(3)
    bookmarks = Bookmark.all
    bookmarks_t = bookmarks.map { |x| x.title }
    expect(bookmarks_t).not_to include('Google')
  end 
end 