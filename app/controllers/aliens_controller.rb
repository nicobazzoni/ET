class AliensController < ApplicationController
    before_action :logged_in_user
    before_action :set_alien, only: [:show, :edit, :update, :destroy]
    def index 
        @aliens = Alien.all
        render :index
    end

    def new
        @alien = current_user.aliens.new
        render :new
    end

    def create
        @alien = current_user.aliens.build(alien_params)
        if @alien.save
            flash[:success] = "Alien has been created!"
        redirect_to @alien
        else
            render :new
        end
    end

    def show
        render :show
    end

    def edit
        @alien = current_user.aliens.find(params[:id])
        render :edit
    end

    def update
        @alien = current_user.aliens.find(params[:id])
      if  @alien.update(alien_params)
        flash[:success] = "Alien updated"
        redirect_to @alien
    else
        render :edit
    end
   end

   def destroy
    @alien.destroy
    redirect_to aliens_path
   end

    def psychic_aliens
        @aliens = Alien.where(psychic: true) 
    end
    
    
    private
    def set_alien
        @alien = Alien.find(params[:id])
    end

    def alien_params
        params.require(:alien).permit(:name, :species, :threat_level, :origin, :psychic, :spaceship_id, :species_id, :user_id)

    end
end
3