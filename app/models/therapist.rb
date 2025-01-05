class Therapist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities, dependent: :destroy
  has_many :therapist_specialities
  has_many :specialities, through: :therapist_specialities

  enum :role, admin: 0, therapist: 1
  before_validation :set_default_role

  validates :first_name, :last_name, :role, presence: true

  private

  def set_default_role
    self.role ||= :therapist
  end
end
