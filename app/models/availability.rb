class Availability < ApplicationRecord
  belongs_to :therapist

  validates :date, :start_time, :end_time, :available, presence: true
  validate :validate_time

  before_validation :set_default_available

  private

  def set_default_available
    self.available ||= true
  end

  def validate_time
    return if start_time.blank? || end_time.blank?

    if self.start_time >= self.end_time
      errors.add(:end_time, "doit être postérieure à l'heure de début du créneau.")
    end
  end
end
