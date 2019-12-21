class UsersController < ApplicationController

    get '/login' do #render login form
        erb :login
    end

    post '/login' do #finds and authenticates a user and logs them in/creates a session
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}" #redirect to user's home/"show" page
        else 
            #tell user they entered invalid credentials and redirect to login page
            redirect '/login'
        end
    end

    get '/signup' do #render form for user to sign up
        erb :signup
    end

    post '/users' do #creates a new user and redirects to user's home page
        if !(params.has_value?(""))
            @user = User.create(params) #creates a user
            session[:user_id] = @user.id #logs them in
            redirect "/users/#{@user.id}"  #redirects to home page
        else  
            redirect '/signup'  #invalid user input...redirect to signup page
        end
    end

    get '/users/:id' do #display user's home/show page
        @user = User.find_by(id: params[:id])
        @goals = @user.goals
        erb :'/users/show'
    end

    get '/logout' do 
        session.clear 
        redirect '/'
    end
end