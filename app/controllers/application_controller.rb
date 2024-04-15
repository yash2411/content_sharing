class ApplicationController < ActionController::Base
    before_action :current_user

    private
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
