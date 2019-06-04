require 'pg'

class Bookmark 

  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end 

  def self.all
    Bookmark.create_connection
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url']}
  end

  def self.add(url)
    Bookmark.create_connection
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end 
end