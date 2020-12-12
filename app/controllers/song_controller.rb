require './config/environment'

class SongController < Sinatra::Base
    
    configure do
        enable :sessions
        set :sessions, "secret"
        set :public_folder, "public"
        set :views, 'app/views/song_views'
    end

    get '/songs' do
        @song = Song.find(params[:id])
        erb :song_edit 
    end

end