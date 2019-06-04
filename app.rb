require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add-bookmark' do 
    erb :add
  end 

  post '/add-bookmark' do
    Bookmark.add(params[:url],params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
