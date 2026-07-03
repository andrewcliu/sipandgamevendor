class SessionsController < ApplicationController
  # Login form view
  def new
  end

  # Processing the login
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  # Logout action
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out."
  end
end