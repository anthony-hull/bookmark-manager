require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    Database.setup
    result = Database.query('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add(url, title)
    @url = url
    return false unless valid_url?
    Database.setup
    Database.query("INSERT INTO bookmarks (url,title) VALUES ('#{url}','#{title}')")
    true
  end

  def self.delete(id:)
    Database.setup
    Database.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    Database.setup
    Database.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id}")
  end

  private

  def self.valid_url?
    @url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
