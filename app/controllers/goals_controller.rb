class GoalsController < ApplicationController
    
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
        set_goal
        erb :'/goals/show'
    end

    get '/goals/:id/edit' do #render form to edit goal
        set_goal
        if logged_in?
            if @goal.user_id == current_user.id 
            erb :'goals/edit'
            else 
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/goals/:id' do 
        set_goal
        if logged_in?
            if @goal.user_id == current_user.id 
            @goal.update(title: params[:title], description: params[:description])
            @goal.save
            redirect "/goals/#{@goal.id}"
            else 
                redirect "/users/#{current_user.id}"
            end
            redirect '/'
        end
    end

    def set_goal 
        @goal = Goal.find(params[:id])
    end

    delete '/goals/:id' do 
        set_goal
        @goal.destroy
        redirect "/users/#{current_user.id}"
    end
end