class AlienPlanetsController < ApplicationController
    before_action :set_alien_planet, only: [:show, :edit, :update, :destroy, :create, :index]
   
    def new
     if params[:species_id] 
        @species = species.find_by(params[:species_id])
        @planet = @species.alien_species.build
      else
        @alien_planet = AlienPlanet.new
      end
    end
  

      
    def index 
        @alien_planets = AlienPlanet.all
        
        
    end

    

    def create
       
         
        @alien_planet = @species.alien_planets.build(alien_planet_params)
        if alien_planet.save
          redirect_to @alien_planet
        else
          render :new
        end
      
    end

    def show
        @alien_planet = @alien_planet.species_name.find_by(params[:id])
    end

    def edit
        render :edit
    end

    def update
      @alien_planet.update(alien_planet_params)
      if @alien_planet.save
        redirect_to @alien_planet
    else
        render :edit
     end
   end

   def destroy
    @alien_planet.destroy
    redirect_to spaceships_path
   end


    private
    def set_alien_planet
        @alien_planet = AlienPlanet.find_by(params[:id])
    end

    def alien_planet_params
        params.require(:alien_planet).permit(:name, :species_id, :planet_id, planets_attributes:[:name])

    end
end
