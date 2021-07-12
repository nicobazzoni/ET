class UsersController < ApplicationController

    before_action :logged_in_user, only: [:show, :edit]
    
    
    def show
      @user = User.find(params[:id])
      @alien_name = @current_user.aliens
      @profile = @current_user.profile_img
    end
  
    def new
      @user = User.new
    end

    def index
      @users = User.where(["name LIKE ? ","%#{params[:search]}%"])
      #   @users = User.all.order('created_at DESC')
      #  @users = @users.search(params[:search]) if params[:search].present?   
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
    
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.save
        redirect_to @user
    else
        render :edit
    end
   end

   def destroy
    @user.destroy
    redirect_to users_path
   end

   def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = User.all.where("lower(name) LIKE :search", search: @parameter)  
    end  
  end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :search)
    end
  end
