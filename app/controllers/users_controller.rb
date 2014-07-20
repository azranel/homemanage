class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successful."
      redirect_to @user
    else
      flash[:notice] = "Wrong params."
      render :new
    end
  end

  def user_params
    params.require(:post).permit(:firstname, :lastname, :email, :salt, :password)
  end
end
