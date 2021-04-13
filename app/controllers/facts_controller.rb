class FactsController < ApplicationController

    get "/become_a_patient" do 
      erb :"/facts/become_a_patient"
    end 

    get "/cannabinoids" do 
        erb :"/facts/cannabinoids"
      end

      get "/laws" do 
        erb :"/facts/laws"
      end

      get "/terpenes" do 
        erb :"/facts/terpenes"
      end
      
  end