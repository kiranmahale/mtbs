require 'rails_helper'

RSpec.describe SeatTemplate, type: :model do
  let(:seat_template) {create(:seat_template)}

	it "is valid with valid attributes" do
  	expect(seat_template).to be_valid
  end

  it "is not valid without seat key" do
  	seat_template.seat_key = nil
  	expect(seat_template).to_not be_valid
  end

  it "is not valid without uniq seat key" do
  	seat_template2 = SeatTemplate.new(seat_key: seat_template.seat_key)
  	expect(seat_template2).to_not be_valid
  end
end
