class ScreeningDetail < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  belongs_to :time_slot

  has_many :bookings
end
