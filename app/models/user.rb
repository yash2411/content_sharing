class User < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
    validates :password, confirmation: true, length: {minimum: 8}, format: {with:/\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/
    }
    validates :terms_of_service, acceptance: true

    has_one :profile, dependent: :destroy
    has_many :articles, dependent: :destroy

end
