class SeatTemplate < ApplicationRecord
  has_and_belongs_to_many :screens

  validates :seat_key, uniqueness: true, presence: true
end
