class SongsController < ApplicationController

    get '/songs' do
        redirect_if_not_logged_in 
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/new' do
        redirect_if_not_logged_in 
        erb :'/songs/new'
    end 

    post '/songs' do
        @song = Song.new(params)
        @song.user_id = session[:user_id]
        @song.save
        redirect '/songs'
    end 

    get '/songs/show/:id' do
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        erb :'/songs/show'
    end     

    get '/songs/:id/edit' do
        redirect_if_not_logged_in
        @song = Song.find(params["id"])
        erb :"/songs/edit/"
    end 



end