class SpeciesController < ApplicationController
    before_action :set_species, only: [:show, :edit, :update, :destroy]
    
    def index
    
      @species = Species.all 
    end
  
    
    def new
      if params[:planet_id] 
        @planet = Planet.find_by(params[:planet_id])
        @species = @planet.alien_planets.build
      else
        @species = Species.new
      end
    end


  

      def show
        
      end
      
      def destroy
        @species.destroy
        redirect_to species_path
       end
      
      private
      def set_species
        @species = Species.find(params[:id])
        end

      def species_params
        params.require(:species).permit(:name, planet_ids:[], planet_attributes: [:name], )
      end
    


end