class Bootcamp < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings

  has_many_attached :photos
end
