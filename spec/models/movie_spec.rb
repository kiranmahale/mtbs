require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) {create(:movie)}

  it "is valid with valid attributes" do
  	expect(movie).to be_valid
  end

  it "is not valid without name" do
  	movie.name = nil
  	expect(movie).to_not be_valid
  end
  
  it "is not valid without description" do
  	movie.description = nil
  	expect(movie).to_not be_valid
  end

	it "is not valid without certificate" do
  	movie.certificate = nil
  	expect(movie).to_not be_valid
  end

	it "is not valid without duration" do
  	movie.duration = nil
  	expect(movie).to_not be_valid
  end

  it "is not valid without star cast" do
  	movie.star_cast = nil
  	expect(movie).to_not be_valid
  end
  
  it "is not valid without release date" do
  	movie.release_date = nil
  	expect(movie).to_not be_valid
  end

  it "is not valid with string duration" do
  	movie.duration = "abcd"
  	expect(movie).to_not be_valid
  end

  it "is not valid with invalid certificate" do
  	movie.certificate = "abcd"
  	expect(movie).to_not be_valid
  end  
end
