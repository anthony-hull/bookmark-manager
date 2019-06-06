require 'PG'
class Database
  def self.setup
    @connection = if ENV['ENVIRONMENT'] == 'test'
                    PG.connect(dbname: 'bookmark_manager_test')
                  else
                    PG.connect(dbname: 'bookmark_manager')
                  end
  end

  def self.query(query)
    @connection.exec(query)
  end
end
