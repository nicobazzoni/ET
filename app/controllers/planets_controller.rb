class PlanetsController < ApplicationController
  before_action :logged_in_user
  before_action :set_planet, only: [:show, :edit, :update, :destroy]
    
  def index
   
      
      @planets = Planet.all

  end
  
  def new
        
        @planet = current_user.planets.new
        render :new
      end
      def create
        @planet = current_user.planets.build(planet_params)
        if @planet.save
            flash[:success] = "planet has been created!"
        redirect_to @planet
        else
            render :new
        end
    end

    def show
     
        
    end

    def edit
      @planet = current_user.planets.find(params[:id])
        
        render :edit
    end

    def update
      @planet.update(planet_params)
      if @planet.save
        redirect_to @planet
    else
        render :edit
    end
   end

   def destroy
    @planet.destroy
    redirect_to planets_path
   end
      
      
      private
      def set_planet
        @planet = Planet.find(params[:id])
        end

      def planet_params
        params.require(:planet).permit(:name, :moons, :user_id)
      end
end
