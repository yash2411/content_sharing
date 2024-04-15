class User < ApplicationRecord
    has_one :profile, dependent: :destroy
    has_secure_password
end
