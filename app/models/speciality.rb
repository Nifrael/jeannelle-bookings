class Speciality < ApplicationRecord
  has_many :therapist_specialities
  has_many :therapists, through: :therapist_specialities
  has_many :availabilities

  validates :name, :default_max_attendance, presence: true
end
