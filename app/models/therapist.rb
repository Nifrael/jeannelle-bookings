class Therapist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities, dependent: :destroy

  enum role: { therapist: 1, admin: 0 }
  before_validation :set_default_role

  validates :first_name, :last_name, :role, presence: true

  private

  def set_default_role
    self.role ||= :therapist
  end
end
