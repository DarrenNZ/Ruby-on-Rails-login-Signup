class UsersController < ApplicationController
	

	def new
		end

	def create
		user = User.new(user_params)
		if user_params[:name].blank?
	    	flash[:danger] = "please input your name" 
	    	redirect_to '/signup'	
	    	return 
	    end
	    if user_params[:email].blank?
	    	flash[:danger] = "please input your email" 
	    	redirect_to '/signup'
	    	return
	    end
	    if user_params[:password].blank?
	    	flash[:danger] = "please input your password" 
	    	redirect_to '/signup'
	    	return
	    end
	    if user_params[:password_confirmation].blank?
	    	flash[:danger] = "please input your password confirmation" 
	    	redirect_to '/signup'
	    	return
	    end
	    if user.save
	    session[:user_id] = user.id
	    flash[:success] = "Welcome to the Sample App!"
	    redirect_to '/'
		end
	end

	private def user_params 
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end

