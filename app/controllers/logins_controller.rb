class LoginsController < ApplicationController
  skip_before_action :authenticate_user
  include Authenticated

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path
  end
end
