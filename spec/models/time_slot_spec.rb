require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  let(:time_slot) {create(:time_slot)}

  it "is valid with valid attributes" do
  	expect(time_slot).to be_valid
  end

  it "is not valid without start time" do
  	time_slot.start_time = nil
  	expect(time_slot).to_not be_valid
  end

  it "is not valid without end time" do
  	time_slot.end_time = nil
  	expect(time_slot).to_not be_valid
  end

  it "is not valid if end time is erlier than start time " do
  	time_slot.end_time = DateTime.now
  	time_slot.start_time = DateTime.now + 1.hour
  	expect(time_slot).to_not be_valid
  end
end
