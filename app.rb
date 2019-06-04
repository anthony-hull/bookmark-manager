require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/add' do 
    erb :add
  end 

  delete '/bookmarks/:id' do
    puts "****"
    puts params[:id]
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  post '/bookmarks/add' do
    Bookmark.add(params[:url],params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
