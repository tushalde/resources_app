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

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :salt)
  end

end
