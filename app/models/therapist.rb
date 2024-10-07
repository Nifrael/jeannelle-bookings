class Therapist < ApplicationRecord
  has_many :availabilities

  validates :first_name, :last_name, presence: true
end
