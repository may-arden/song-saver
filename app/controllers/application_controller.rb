require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "song_saver_secret" 
  end

  get "/" do
    erb :index
  end

  get '/user' do
    erb :'user/user'
  end 

  helpers do

    def logged_in?
      !!current_user 
    end 

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
    
  end 

end
