class GoalsController < ApplicationController

    get '/goals' do #index page for all goals
        erb :index
    end
    
    
    get '/goals/new' do #render a form to create a new goal
        erb :'goals/new'
    end

    post '/goals' do #creates a new goal and redirects to that goal's show page
        if !(params.has_value?(""))
            @goal = Goal.create(params)
            redirect "/goals/#{@goal.id}"
        else 
            Invalid entry. Try again
        end
    end

    get '/goals/:id' do #show page for single goal
        erb :show
    end
end