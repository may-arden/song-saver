require './config/environment'

class UserController < Sinatra::Base

configure do
    enable :sessions
    set :session_secret, "secret" # CHANGE THIS TO SOMETHING MORE SECURE
    set :public_folder, 'public'
    set :views, 'app/views/user_views'
  end

  get '/' do 
    erb :index
  end 

end