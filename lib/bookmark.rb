require 'pg'

class Bookmark 

  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end 

  def self.title
    Bookmark.create_connection
    result = @connection.exec("SELECT title FROM bookmarks;")
    result.map { |bookmark| bookmark['title'] } 
  end

  def self.url
    Bookmark.create_connection
    result = @connection.exec("SELECT url FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] } 
  end

  def self.add(url)
    Bookmark.create_connection
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end 
end