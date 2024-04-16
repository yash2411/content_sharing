class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :authenticate_user

    private

    def authenticate_user
        redirect_to login_path if session[:user_id].nil?
    end
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
