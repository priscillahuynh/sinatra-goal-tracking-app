class UsersController < ApplicationController

    get '/login' do #render login form
        erb :login
    end

    get '/signup' do 
        erb :signup
    end
end