class Therapist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities

  enum role: { user: 1, admin: 0 }

  validates :first_name, :last_name, presence: true
end
