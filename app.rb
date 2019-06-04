require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do 
    'Bookmark Manager'
  end 

  get '/bookmarks' do
    @title = Bookmark.title
    @url = Bookmark.url
    erb :index
  end

  get '/add-bookmark' do 
    erb :add
  end 

  post '/add-bookmark' do
    Bookmark.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
