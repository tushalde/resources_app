class SessionsController < ApplicationController
  def new
  end
  
  def create
  	user = User.find_by(email: params[:session][:email]) || User.find_by(username: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		flash[:notice] = "You logged in successfully"
  		redirect_to root_url
  	else
  		flash[:danger] = "Invalid email/password combination"
	  	render 'new'
	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
