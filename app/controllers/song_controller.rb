class SongController < ApplicationController

    get '/songs' do
        erb :'song/songs'
    end

    get '/create_song' do
        erb :'song/create_song'
    end 

end