class UsersController < ApplicationController

    get '/login' do #render login form
        erb :login
    end

    post '/login' do #finds and authenticates a user and logs them in/creates a session
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
        
        else 
            #tell user they entered invalid credentials and redirect to login page
            redirect '/login'
        end
    end

    get '/signup' do #render form for user to sign up
        erb :signup
    end
end