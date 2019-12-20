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
            @user = User.create(params)
            redirect "/users/#{@users.id}" 
        else  
            #invalid user input...redirect to signup page
            redirect '/signup'
        end
    end

    get '/users/:id' do #display user's home/show page
        erb :'/users/show'
    end
end