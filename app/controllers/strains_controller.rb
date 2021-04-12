class StrainsController < ApplicationController

    #index
    get "/strains" do
        if logged_in?
            @strains = current_user.strains
            erb :'strains/index'
        else
            redirect to('/login')
        end
    end

    #new
    get "/strains/new" do
        if logged_in?
            @current_user
            erb :'strains/create_strain'
        else
            redirect to('/login')
        end
    end

    #create
    post "/strains" do
        if logged_in?
            @strain = current_user.strains.build(params)
            if !@strain.save
              @errors = @strain.errors.full_messages
              erb :'/strains/create_strain'
            else
              redirect to('/strains')
            end
        else
            redirect to('/login')
        end  
    end

    #show
    get "/strains/:id" do
        @strain = Strain.find_by_id(params[:id])
        if logged_in? && @strain.user == current_user
            erb :'strains/show_strain'
        else
            redirect to('/login')
        end
    end

    #edit
    get "/strains/:id/edit" do
        @strain = strain.find(params[:id])
        if logged_in? && @strain.user == current_user
            @strain = strain.find(params[:id])
            @user = User.find(session[:user_id])
            erb :'strains/update_strain'
        else
            redirect to('/login')
        end
    end

    #update
    patch "/strains/:id" do
        @strain = Strain.find(params[:id])
        @strain.name = params[:name]
        @strain.date = params[:date]
        @strain.form = params[:form]
        @strain.thc = params[:thc]
        @strain.cbd = params[:cbd]
        @strain.review = params[:review]
        if !@strain.save
          @errors = @strain.errors.full_messages
          erb :'/strains/update_strain'
        else
          redirect to("/strains/#{@strain.id}")
        end 
    end

    #delete
    delete "/strains/:id" do
        @strain = Strain.find(params[:id])
        if logged_in? && @strain.user == current_user
          @strain.destroy
          redirect to('/strains')
        else
          redirect to('/login')
        end
      end
end



 
