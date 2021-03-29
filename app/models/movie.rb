class Movie < ApplicationRecord
  has_many :screens, through: :screening_details

  has_one_attached :poster

  validates :name, :description, :certificate, :duration, :star_cast, :release_date, presence: true
  validates :duration, numericality: { greater_than_or_equal_to: 0 }
  validates :certificate, inclusion: { in: MOVIE_CERTIFICATE }
end
