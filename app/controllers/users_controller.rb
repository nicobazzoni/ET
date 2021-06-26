class UsersController < ApplicationController

    before_action :logged_in_user, only: [:show]
    
    
    def show
      @user = User.find(params[:id])
      @alien_name = @current_user.aliens
    end
  
    def new
      @user = User.new
    end

    def index
        @users = User.all
    end 
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to ET CREATOR!"
        redirect_to @user
      else
        render 'new'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
