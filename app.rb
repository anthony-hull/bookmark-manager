require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
