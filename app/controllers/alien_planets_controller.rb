class AlienPlanetsController < ApplicationController
    before_action :set_alien_planet, only: [:show, :edit, :update, :destroy, :create, :index]
    before_action :set_planet
    def new
      @alien_planet = AlienPlanet.new
      render :new 
    end
  

      
    def index 
      
      if @planet
        @alien_planets = @planet.alien_planets
       else
        @alien_planets = AlienPlanet.all 
       end
       render :index
      end
        
      def create
       
       @alien_planet = AlienPlanet.new(alien_planet_params)
       if @alien_planet.save
        redirect_to @alien_planet 
       else
        render :new
       end
      
    end

    def show
      
     @alien_planet = AlienPlanet.find_by(params[:id])
     
      render :show
      
    end

    def edit
        render :edit
    end

    def update
      if @alien_planet.update(alien_planet_params)
    
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

    def set_planet 
      @planet = Planet.find_by_id(params[:id])
    end
    def set_alien_planet
        @alien_planet = AlienPlanet.find_by(params[:id])
    end

    def alien_planet_params
        params.require(:alien_planet).permit(:name, :species_id, :planet_id)

    end
end
