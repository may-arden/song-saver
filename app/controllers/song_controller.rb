

class SongController < ApplicationController

    get '/songs' do
        @song = Song.find(params[:id])
        erb :song_edit 
    end

end