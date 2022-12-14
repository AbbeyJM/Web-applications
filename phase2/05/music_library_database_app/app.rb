# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/' do
    return erb(:hello)
  end

  post '/albums' do
    repo = AlbumRepository.new
    new_album = album.new
    new_album.title = params[:title]
    new_album.release_year = params[release_year]
    new_album.artist_id = params[artist_id]
  
    repo.create(new_album)
    return ''
  end

  get '/albums/:id' do
    repo = AlbumRepository.new
    artist_repo = ArtistRepository.new

    @album = repo.find(params[:id])
    @artist = artist_repo.find(@album.artist_id)
    
    return erb(:album)
  end

  get '/artists' do
    artists = params[:artists]

    return "Pixies, ABBA, Taylor Swift, Nina Simone"
  end
end