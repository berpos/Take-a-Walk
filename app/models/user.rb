class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :walkers
  has_many :walkers, through: :bookings
  has_one_attached :photo

  validates :first_name, :last_name, :address, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :phone_number, numericality: { only_integer: true }, length: { in: 10..15 }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
