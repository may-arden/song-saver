class SongsController < ApplicationController

# use current_user.songs to make sure to return songs belonging to current user's songs

    get '/songs' do
        redirect_if_not_logged_in 

        @songs = Song.all
        erb :'/songs/index'
    end

    get '/new' do
        # '/songs/new' << change
        redirect_if_not_logged_in 
        erb :'/songs/new'
    end 

    post '/songs' do
        # if this new object doesn't have blank parameters, then 
        if (params[:title]) == "" || params[:genre] == "" || params[:composer] == ""
            redirect '/new'
         
        
        else  
            @song = Song.new(params)
            @song.user_id = session[:user_id]
            @song.save
            redirect '/songs'
        end 
    end 

    get '/songs/show/:id' do
        # change to '/songs/:id'
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        erb :'/songs/show'
    end     

    get '/songs/edit/:id' do
        # change to '/song/:id/edit'
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        if @song.user == current_user 
            erb :'/songs/edit'
        else 
            redirect '/songs'
        end 
    end 

    
    patch '/songs/edit/:id' do
        # add validation make helper (redirect if not authorized)
        @song = Song.find(params[:id])
        @song.update(params[:songs])
        @song.save 
        erb :'/songs/show'
    end 

    delete '/songs/:id' do
        # add validation make helper
        redirect_if_not_logged_in
        @song = Song.find(params[:id])
        @song.destroy
        redirect '/songs'
    end 

private

def redirect_if_not_correct_user(user)
    if current_user != user
        redirect '/'
    end 
end 


end