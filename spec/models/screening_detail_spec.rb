require 'rails_helper'

RSpec.describe ScreeningDetail, type: :model do
  let(:screening_detail) {create(:screening_detail)}

	it "is valid with valid attributes" do
  	expect(screening_detail).to be_valid
  end

  it "is not valid without movie" do
  	screening_detail.movie = nil
  	expect(screening_detail).to_not be_valid
  end
  it "is not valid without screen" do
  	screening_detail.screen = nil
  	expect(screening_detail).to_not be_valid
  end

  it "is not valid without time slot" do
  	screening_detail.time_slot = nil
  	expect(screening_detail).to_not be_valid
  end
end
