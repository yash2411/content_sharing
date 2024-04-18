class LoginsController < ApplicationController
  skip_before_action :authenticate_user
  include Authenticated

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path
  end
end
