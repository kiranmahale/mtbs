require 'rails_helper'

RSpec.describe "landing/home.html.erb", type: :view do
  it "displays the movies" do
    assign(:movies, [stub_model(Movie, :name => "Testing")])

    render :template => "landing/home.html.erb"

    expect(rendered).to match(/Testing/)
  end
end
