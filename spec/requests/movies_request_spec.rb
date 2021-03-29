require 'rails_helper'
require 'devise_request_spec_helpers.rb'

RSpec.describe "Movies", type: :request do

  describe "movie managment" do
  	include DeviseRequestSpecHelpers

  	movie_data = { 
  									name:"Test Movie",
	    							description: "T",
	    							certificate: "U",
	    							duration: 120,
	    							star_cast: "Kiran",
	    							release_date: Date.today
	    						}

	  before :each do
	    sign_in(create(:user))
	  end

	  it "should create movie record and redirect to index page" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    post "/movies", :params => { :movie => movie_data}
	    expect(response).to have_http_status(:redirect)
	    expect(response).to redirect_to("/movies")
	    follow_redirect!
	    expect(response).to render_template(:index)
	  end

	  it "should stay on new page if name is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:name] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end

	  it "should stay on new page if duration is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:duration] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end

	  it "should stay on new page if certificate is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:certificate] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end

	  it "should stay on new page if description is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:description] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end

	  it "should stay on new page if star cast is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:star_cast] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end

	  it "should stay on new page if release date is nil" do
	    get "/movies/new"
	    expect(response).to render_template(:new)

	    movie_data[:release_date] = nil
	    post "/movies", :params => { :movie => movie_data}

	    expect(response).to render_template(:new)
	    expect(flash[:error]).to eq("Failed to create movie !!!!")
	  end
	end
end
