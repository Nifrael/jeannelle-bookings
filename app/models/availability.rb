class Availability < ApplicationRecord
  belongs_to :therapist

  validates :date, :start_time, :end_time, :available, presence: true
end
