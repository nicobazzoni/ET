class AlienPlanetsController < ApplicationController
  before_action :logged_in_user
  before_action :set_alien_planet, only: [:show, :edit, :update, :destroy, :create, :index]
  before_action :set_species
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
        redirect_to @alien_planet.planet 
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
      if @alien_planet.update(alien_planet_params)
    
        redirect_to @alien_planet
    else
        render :edit
     end
   end

   
    
    def campaigns
    @planet = AlienPlanet.most_campaigns
      
     end
    
    
   

   def destroy
    @alien_planet.destroy
    redirect_to planets_path
   end


    private

    def set_planet 
      @planet = Planet.find_by_id(params[:planet_id])
    end
    def set_alien_planet
        @alien_planet = AlienPlanet.find_by(params[:alien_planetid])
    end
    def set_species 
      @species = Species.find_by_id(params[:species_id])
    end

    def alien_planet_params
        params.require(:alien_planet).permit(:name, :species_id, :planet_id)

    end
end
