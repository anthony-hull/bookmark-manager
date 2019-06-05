require './lib/database'

describe Database do
  it 'creates a connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    Database.setup
  end

  it 'queries the database' do
    db_connection = Database.setup
    expect(db_connection).to receive(:exec).with('SELECT * FROM bookmarks')
    Database.query('SELECT * FROM bookmarks')
  end
end