class RegistrationsController < ApplicationController
    skip_before_action :authenticate_user
    include Authenticated

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to new_profile_path
        else
        end
    end

    def check_email_uniqueness
        email = params[:email]
        user = User.find_by(email: email)
        render json: { unique: user.nil? }
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :terms_of_service)
    end
end
