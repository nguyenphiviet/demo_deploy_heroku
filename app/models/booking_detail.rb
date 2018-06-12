class BookingDetail < ApplicationRecord
  belongs_to :dish
  belongs_to :booking
end
