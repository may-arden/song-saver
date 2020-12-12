

class SongController < ApplicationController

    get '/songs' do
        erb :'song/songs'
    end

end