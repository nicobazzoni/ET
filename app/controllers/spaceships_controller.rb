class SpaceshipsController < ApplicationController
before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
    def index 
        @spaceships = Spaceship.all
        @aliens = Alien.all 
        render :index
    end

    def new
        @spaceship = Spaceship.new
        render :new
    end

    def create
        @spaceship = Spaceship.new(spaceship_params)
        if @spaceship.save
        redirect_to @spaceship
        else
            render :new
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
      @spaceship.update(spaceship_params)
      if @spaceship.save
        redirect_to @spaceship
    else
       
     end
   end

   def destroy
    @spaceship.destroy
    redirect_to spaceships_path
   end


    private
    def set_spaceship
        @spaceship = Spaceship.find(params[:id])
    end

    def spaceship_params
        params.require(:spaceship).permit(:name, :speed, :alien_id)

    end
end