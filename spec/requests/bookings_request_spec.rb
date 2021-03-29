
require 'rails_helper'
require 'devise_request_spec_helpers.rb'

RSpec.describe "Bookings", type: :request do

  describe "booking managment" do
  	include DeviseRequestSpecHelpers

  	booking_data = { 
  									ticket_total: 354,
  									seat: {"A_4"=>"yes"}
	    						}

	  before :each do
	    sign_in(create(:user))
	  end

	  it "should redirect to home page if screening_details does not exists" do
	    movie = create(:movie)

	    get "/initiate_booking", :params => {id: movie.id}

	    expect(response).to have_http_status(:redirect)
	    follow_redirect!
	    expect(response).to render_template(:home)
	  end

	  it "should create booking record and redirect to booking show page" do
	    movie = create(:movie)
	    screening_detail = create(:screening_detail, movie: movie)

	    get "/initiate_booking", :params => {id: movie.id}

	    expect(response).to render_template(:initiate_booking)

	    booking_data[:screening_details_id] = screening_detail.id
	    post "/process_booking", :params => booking_data

	    expect(response).to have_http_status(:redirect)
	    follow_redirect!
	    expect(response).to render_template(:show)
	  end

	  it "should redirect to home page if screening_details is not present" do
	    movie = create(:movie)
	    screening_detail = create(:screening_detail, movie: movie)

	    get "/initiate_booking", :params => {id: movie.id}

	    expect(response).to render_template(:initiate_booking)

	    booking_data[:screening_details_id] = nil
	    
	    post "/process_booking", :params => booking_data

	    expect(response).to have_http_status(:redirect)
	    follow_redirect!

	    expect(response).to render_template(:home)
	  end

	  it "should redirect to home page if amount is not present" do
	    movie = create(:movie)
	    screening_detail = create(:screening_detail, movie: movie)

	    get "/initiate_booking", :params => {id: movie.id}

	    expect(response).to render_template(:initiate_booking)

	    booking_data[:ticket_total] = nil
	    
	    post "/process_booking", :params => booking_data

	    expect(response).to have_http_status(:redirect)
	    follow_redirect!

	    expect(response).to render_template(:home)
	  end

	  it "should redirect to home page if seat is not present" do
	    movie = create(:movie)
	    screening_detail = create(:screening_detail, movie: movie)

	    get "/initiate_booking", :params => {id: movie.id}

	    expect(response).to render_template(:initiate_booking)

	    booking_data[:seat] = nil
	    
	    post "/process_booking", :params => booking_data

	    expect(response).to have_http_status(:redirect)
	    follow_redirect!

	    expect(response).to render_template(:home)
	  end
	end
end
