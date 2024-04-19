class EmailConfirmationMailer < ApplicationMailer
    def send_email_activation_link
        email = params[:email]
        host = params[:host]
        @url = generate_url(email, host)
        mail(to: email, from: 'No Reply', subject: "Confirm your email")
    end

    def generate_url(email, host)
        token = SecureRandom.hex(20)
        user = User.find_by_email(email)
        user.update(confirmation_token: token) unless user.nil?
        @url = "#{host}/verify_email?token=#{token}&id=#{user.id}"
    end
end
