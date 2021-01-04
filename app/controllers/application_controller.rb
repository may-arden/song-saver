require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :index
  end

  get '/error' do
    erb :error 
  end 

  not_found do 
    status 404
    redirect to '/error'
  end 


  helpers do

    def logged_in?
      !!current_user 
    end 

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end 
    end 
    
  end 

end
