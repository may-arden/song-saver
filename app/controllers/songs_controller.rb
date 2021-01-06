class SongsController < ApplicationController

# use current_user.songs to make sure to return songs belonging to current user's songs

    get '/songs' do
        redirect_if_not_logged_in 

        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        redirect_if_not_logged_in 
        erb :'/songs/new'
    end 

    post '/songs' do
        if (params[:title]) == "" || params[:genre] == "" || params[:composer] == ""
            redirect '/new'
         
        
        else  
            @song = Song.new(params)
            @song.user_id = session[:user_id]
            @song.save
            redirect '/songs'
        end 
    end 

    get '/songs/:id' do
        redirect_if_not_logged_in
        redirect_if_not_correct_user
        @song = Song.find(params[:id])
        erb :'/songs/show'
    end     

    get '/songs/:id/edit' do
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        if @song.user == current_user 
            erb :'/songs/edit'
        else 
            redirect '/songs'
        end 
    end 

    
    patch '/songs/:id' do
        @song = Song.find(params[:id])
        @song.update(params[:songs])
        @song.save 
        redirect '/songs'
    end 

    delete '/songs/:id' do
        redirect_if_not_correct_user
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        @song.destroy
        redirect '/songs'
    end 



end