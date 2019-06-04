require 'pg'

class Bookmark 
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    Bookmark.create_connection
    result = @connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end

  end

  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end 

  def self.add(url)
    Bookmark.create_connection
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end 
end