class TimeSlot < ApplicationRecord
  validates :start_time, :end_time, presence: true
  validate :validate_start_and_end_time

  def start_end_time
    "#{convert_time(start_time)} - #{convert_time(end_time)}"
  end

  def convert_time(time)
    rem, hour = time.divmod(12)
    "#{hour.zero? ? 12 : hour} #{rem.zero? ? 'a' : 'p'}m"
  end

  private

  def validate_start_and_end_time
    errors.add(:end_time, 'must be after start time') if self.start_time && self.end_time && self.start_time >= self.end_time
  end
end
