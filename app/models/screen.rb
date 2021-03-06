class Screen < ApplicationRecord
  has_many :movies, through: :screening_details
  has_and_belongs_to_many :seat_templates

  validates :name, presence: true
end
