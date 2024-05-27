class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :walkers
  has_many :walkers, through: :bookings

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true, presence: true
end
