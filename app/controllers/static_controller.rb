class StaticController < ApplicationController
  before_action :check_user_profile

  def index
  end

  private
  
  def check_user_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end
end
