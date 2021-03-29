class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :user
      t.belongs_to :screening_detail
      t.string :booking_amount
      t.string :seat_number, array: true, default: []
      t.timestamps
    end
  end
end
