class usersController < ApplicationController

    get "/sign_up" do 
      erb :"/users/new"
    end 
    
    post "/sign_up" do 
      if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:email] && params[:user][:username]
        @user = User.new(params[:user])
        if @user.save 
          session[:user_id] = @user.id
          redirect to "/strains"
        else 
          redirect to "/sign_up"
        end
      else 
        redirect to "/sign_up"
      end 
    end  
  end