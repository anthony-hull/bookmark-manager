require './lib/database'

describe Database do
  it 'creates a connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager')
  end
end