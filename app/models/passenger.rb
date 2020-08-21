class Passenger < ApplicationRecord

  has_many :bookings
  has_many :flights, through: :bookings

  validates_uniqueness_of :email
end
