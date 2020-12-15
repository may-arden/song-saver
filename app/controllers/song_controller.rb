class SongController < ApplicationController

    get '/songs' do
        erb :'song/songs'
    end

    post '/songs' do
    @songs = Song.new(:title => params[:title], :genre => params[:genre], :composer => params[:composer])
    @songs.save
    redirect to '/songs'
    end 

    get '/create_song' do
        erb :'song/create_song'
    end 

end