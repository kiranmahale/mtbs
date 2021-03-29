class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screening_detail

  validates :booking_amount, :seat_number, presence: true
end
