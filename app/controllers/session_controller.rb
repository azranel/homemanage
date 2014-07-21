class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params["email"], params["password"])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Logged successfully"
      render @user
    else
      flash.now[:alert] = "Wrong email or password. Try again!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end
end
