

class UserController < ApplicationController

  get '/signup' do
    erb :'user/create_user'
  end

  post '/signup' do 
    user = User.find_by_username(params[:user])

    if params[:username] == "" || params[:password_digest] == ""
      redirect to '/signup'
    end

    if params[:user][:username].split.any?{ |char| char =~ /\W/ }
      redirect to '/signup'
    end 

    if user || user
      redirect to '/signup'
    end
  
    if @user = User.new(:username => params[:username], :password_digest => params[:password_digest])
      @user.save
      session[:user_id] = @user.id 
      redirect to '/songs'
    end 

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

  private

  def logged_in?
    !!session[:user_id]
  end 

  def redirect_if_logged_in
    if logged_in?
      redirect '/'
    end 
  end 

  

end