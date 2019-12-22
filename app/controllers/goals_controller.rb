class GoalsController < ApplicationController

    get '/goals' do #index page for all goals
        erb :index
    end
    
    
    get '/goals/new' do #render a form to create a new goal
        erb :'goals/new'
    end

    post '/goals' do #creates a new goal and redirects to that goal's show page
        if !logged_in?
            redirect '/'
        end
        if !(params.has_value?("")) 
            @goal = Goal.create(title: params[:title], description: params[:description], user_id: current_user.id)
            redirect "/goals/#{@goal.id}"
        else 
            Invalid entry. Try again
        end
    end

    get '/goals/:id' do #show page for single goal
        @goal = Goal.find(params[:id])
        erb :'/goals/show'
    end

    get '/goals/:id/edit' do #render form to edit goal
        @goal = Goal.find(params[:id])
        erb :'goals/edit'
    end

    patch '/goals/:id' do 
        @goal = Goal.find(params[:id])
        @goal.update(title: params[:title], description: params[:description])
        @goal.save
        redirect "/goals/#{@goal.id}"
    end
end