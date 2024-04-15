require 'faker'
FactoryBot.define do
    factory :profile do
        full_name {'test@gmail.com'}
    end
end 