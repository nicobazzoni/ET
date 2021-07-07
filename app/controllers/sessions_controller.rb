class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_back_or user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      log_out
      redirect_to root_url
    end

    def google_omniauth
      user_info = request.env['omniauth.auth']["info"]
      user = User.find_or_create_from_google(user_info)
      if user
        session[:user_id] = user.id
        redirect_to user
      else
        flash[:errors] = user.errors.full_messages
        redirect_to login_path
      end
    end
  end