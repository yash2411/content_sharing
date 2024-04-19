module Authenticated
    extend ActiveSupport::Concern

    included do
        before_action :check_user, except: [:destroy, :verify_account]
    end

    def check_user
        unless session[:user_id].nil?
            redirect_to root_path
        end
    end
end