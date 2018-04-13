class SessionsController < ApplicationController
	
	def new
  end

 def create
 	temp = User.new(temp_params)
    user = User.find_by_email(temp_params[:email])
    if temp_params[:email].blank?
	    	flash[:danger] = "please input your email" 
	    	redirect_to '/login'
	    	return
	end
	if temp_params[:password].blank?
	    	flash[:danger] = "please input your password" 
	    	redirect_to '/login'
	    	return
	end
    # If the user exists AND the password entered is correct.
    
    if user && user.authenticate(temp_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      flash[:success] = "Welcome to the Sample App!"

      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:danger] = "oh no!"
      redirect_to '/login'

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private def temp_params 
		params.require(:user).permit(:email, :password)
	end
end
