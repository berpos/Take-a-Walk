class Walker < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
end
