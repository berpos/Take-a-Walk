class Walker < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :phone_number, numericality: { only_integer: true }, length: { in: 10..15 }
end
