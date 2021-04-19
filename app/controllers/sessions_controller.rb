class SessionsController < ApplicationController

    get "/login" do 
      if logged_in?
        redirect to "/strains"
      else
        erb :"/users/login"
      end
    end 
    
    post "/login" do 
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect to "/strains"
      else 
        redirect to "/login"
      end 
    end 
    
    get "/logout" do 
      session.destroy 
      redirect to "/sign_up"
    end 
    
  end