class UsersController < ApplicationController

  get '/users' do
    redirect_if_not_logged_in
    @user = current_user.songs 
    erb :'/users/index'
  end 

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do 
  
    if params[:username] == "" || params[:password] == ""
       redirect to '/signup'
    end 

    if params[:username].split.any?{ |char| char =~ /\W/ }
       redirect to '/signup'
    end 
     
    if User.find_by_username(params[:username]) != nil
      redirect to '/signup'
    end 
  
    @user = User.new(:username => params[:username], :password => params[:password])
    @user.save
    session[:user_id] = @user.id 
    redirect to '/users'
     
  end 

  get '/login' do
    erb :'users/login' 
  end 

  post '/login' do
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/users'
    else  
      redirect '/login'
    end 

  end 

  get '/logout' do
    session.clear 
    redirect '/'
  end 

end