class LandingController < ApplicationController
  def home
    @movies = Movie.where("release_date >= '#{LANDING_MOVIE_DATE}'")
                   .limit(6)
                   .order(:release_date)
                   .select(:id, :name, :certificate, :duration)
  end
end
