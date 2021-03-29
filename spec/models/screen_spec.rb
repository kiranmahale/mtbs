require 'rails_helper'

RSpec.describe Screen, type: :model do
	let(:screen) {create(:screen)}

	it "is valid with valid attributes" do
  	expect(screen).to be_valid
  end

  it "is not valid without valid attributes" do
  	screen.name = nil
  	expect(screen).to_not be_valid
  end
end
