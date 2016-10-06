class UsersController < ApplicationController

  attr_accessor :firstname, :lastname, :username, :email, :password, :password_confirmation

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      log_in @user
      redirect_to root_url
    else
      flash[:error] = "Errors in form"
      render 'new'
    end
  end

  def profile
  	if logged_in?
  		@user = current_user
  		render 'profile'
  	else
  		flash[:danger] = "You must be signed in to view this page"
  		redirect_to login_path
  	end
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :salt)
  end

end
