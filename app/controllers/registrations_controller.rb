class RegistrationsController < ApplicationController
    skip_before_action :authenticate_user, except: :verify_account

    skip_before_action :check_account_status
    include Authenticated

    def verify_account
        if current_user.activated?
            redirect_to root_path
        else
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            EmailConfirmationMailer.with(email: @user.email, host: request.base_url).send_email_activation_link.deliver_later
            session[:user_id] = @user.id
            redirect_to verify_account_path
        else

        end
    end

    def check_email_uniqueness
        email = params[:email]
        user = User.find_by(email: email)
        render json: { unique: user.nil? }
    end

    def verify_email
        user = User.find_by_id(params[:id])
        if user.update(activated: true)
            flash[:success] = 'Your email has been verified'
            redirect_to root_path
        else 
            flash[:danger] = 'Account not found'
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :terms_of_service)
    end

    def check_account_status
        redirect_to verify_account_path if User.find_by_id(session[:user_id])
    end
end
