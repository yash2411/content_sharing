class Profile < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
  validates :dob, comparison: {less_than: Date.today - 16.years}
  validates :bio, length: {in: 20..100}
end
