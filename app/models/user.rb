class User < ApplicationRecord
    has_secure_password
  
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
    validates :password, confirmation: true, length: { minimum: 8 }, format: { with: /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/ }, on: :create
  
    # Only validate password confirmation and length if password field is present during update
    validates :password_confirmation, presence: true, if: :password_changed?
    validates :password, length: { minimum: 8 }, format: { with: /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/ }, if: :password_changed?
  
    validates :terms_of_service, acceptance: true
  
    has_one :profile, dependent: :destroy
    has_many :articles, dependent: :destroy
  
    # Helper method to check for password change
    def password_changed?
      @password_digest_was.present? && password.present? && password != @password_digest_was
    end
  end
  