class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :booking_details
  has_many :bills
end
