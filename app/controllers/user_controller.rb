class UserController < ApplicationController

  get '/user' do
    redirect_if_not_logged_in
    @user = current_user.user 
    erb :'/user/user'
  end 

  get '/signup' do
    erb :'user/create_user'
  end

  post '/signup' do 

    # check to make sure the form is not empty 
    if params[:username] == "" || params[:password_digest] == ""
       redirect to '/signup'
    end 

    # check to make sure the input does not contain non-alphanumerical characters
    if params[:username].split.any?{ |char| char =~ /\W/ }
       redirect to '/signup'
    end 
     
    # check to see if username is already in use -- below code does not work.
    # else !username.uniq? 
    #   redirect to '/signup'
    # end 
  
    # initialize a new instance of the User class, setting the current session user to 
    # current user and storing login information.
    @user = User.new(:username => params[:username], :password => params[:password_digest])
    @user.save
    session[:user_id] = @user.id 
    redirect to '/user'
     
  end 

  get '/login' do
    erb :'user/login' 
  end 

  post '/login' do
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect to '/songs'
    end 

  end 

  get '/logout' do
    redirect '/index'
  end 

  post '/logout' do
    session.clear 
    redirect to '/index'
  end 

end