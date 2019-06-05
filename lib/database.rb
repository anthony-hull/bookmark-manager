require 'PG'
class Database
  def self.setup
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.query(query)
    @connection.exec(query)
  end
end