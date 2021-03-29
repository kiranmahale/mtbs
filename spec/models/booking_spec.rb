require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:booking) {create(:booking)}

  it "is valid with valid attributes" do
  	expect(booking).to be_valid
  end

  it "is not valid without amount" do
  	booking.booking_amount = nil 
  	expect(booking).to_not be_valid
  end

  it "is not valid without user" do
  	booking.user = nil
  	expect(booking).to_not be_valid
  end

  it "is not valid without screening detail" do
  	booking.screening_detail = nil
  	expect(booking).to_not be_valid
  end

  it "is not valid without seat number" do
    booking.seat_number = nil
    expect(booking).to_not be_valid
  end
end
