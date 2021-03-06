require 'sinatra/base'
require './lib/bookmark'
require './lib/database'
require 'uri'
require 'sinatra/flash'


class BookmarkManager < Sinatra::Base
  enable :method_override
  enable :sessions
  register Sinatra::Flash

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
    if Bookmark.add(params[:url], params[:title])
      redirect '/bookmarks'
    else
      flash[:notice] = "#{params[:title]} is not a valid url"
      redirect '/bookmarks/add'
    end
  end

  run! if app_file == $PROGRAM_NAME
end
