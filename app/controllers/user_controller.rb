

class UserController < ApplicationController

  get '/signup' do
    # if !logged_in?
      erb :'user/create_user'
    # else 
    #   redirect to '/'
    # end 
  end

  post '/signup' do 
    if params[:username] == " " || params[:password_digest] == " "
      redirect to '/signup'
    else 
      @user = User.new(:username => params[:username], :password_digest => params[:password_digest])
      @user.save
      session[:user_id] = @user.id 
      redirect to '/songs'
    end 
  end 

  get '/login' do
    if !logged_in?
      erb :'user/login'
    else  
      redirect to '/'
    end 
  end 

  post '/login' do
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/songs'
  end 

  

end