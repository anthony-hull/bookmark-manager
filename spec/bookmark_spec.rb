require 'bookmark' 

describe 'Bookmark' do 
  let(:bookmark) { Bookmark.new }

  it 'all method shows array of bookmark instances' do 
    expected_array = ["www.google.com", "www.bbc.co.uk", "www.bing.com"]
    expect(Bookmark.all).to eq(expected_array)
  end 
end 