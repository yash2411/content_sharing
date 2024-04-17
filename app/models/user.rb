class User < ApplicationRecord
    has_secure_password

    has_one :profile, dependent: :destroy
    has_many :articles, dependent: :destroy
end
