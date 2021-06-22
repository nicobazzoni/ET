class AliensController < ApplicationController
before_action :set_alien, only: [:show, :edit, :update, :destroy]
    def index 
        @aliens = Alien.all
        render :index
    end

    def new
        @alien = Alien.new
        render :new
    end

    def create
        @alien = Alien.new(alien_params)
        if @alien.save
        redirect_to @alien
        else
            render :new
        end
    end

    def show
        render :show
    end

    def edit
        render :edit
    end

    def update
      @alien.update(alien_params)
      if @alien.save
        redirect_to @alien
    else
        render :edit
    end
   end

   def destroy
    @alien.destroy
    redirect_to aliens_path
   end


    private
    def set_alien
        @alien = Alien.find(params[:id])
    end

    def alien_params
        params.require(:alien).permit(:name, :species, :threat_level, :origin, :psychic, :spaceship_id, :species_id)

    end
end
