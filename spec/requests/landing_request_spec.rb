require 'rails_helper'
require 'devise_request_spec_helpers.rb'

RSpec.describe "Landings", type: :request do
  describe "GET /" do
 		include DeviseRequestSpecHelpers
    
    it "should redirect to users sign_in page when not logged in" do
      get "/"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to("/users/sign_in")
    end

    it "should redirect to users sign_in page when not logged in" do
      user = create(:user)
      sign_in(user)

      get "/"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:home)
    end
  end
end
