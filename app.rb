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
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  get '/bookmarks/:id/edit' do
    @id = params[:id]
    erb(:edit)
  end 

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end 

  post '/bookmarks/add' do
    Bookmark.add(params[:url],params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
