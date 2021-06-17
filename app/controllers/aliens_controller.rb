class AliensController < ApplicationController
before_action :set_alien, only: [:show, :edit, :update, :destroy]
    def index 
        @aliens = Alien.all
    end

    def show

    end

    def edit

    end



    private
    def set_alien
        @alien = Alien.find(params[:id])
    end
end
