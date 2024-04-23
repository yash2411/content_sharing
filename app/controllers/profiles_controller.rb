class ProfilesController < ApplicationController
  def new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :bio, :dob, :phone_number, :location)
  end
end
