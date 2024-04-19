class ContentsController < ApplicationController
  before_action :check_user_profile

  def index
  end

  private

  def check_user_profile
    redirect_to new_profile_path unless current_user.profile.present?
  end
  
end
