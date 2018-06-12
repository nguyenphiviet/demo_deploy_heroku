class Bill < ApplicationRecord
  belongs_to :customer
  belongs_to :booking
end
