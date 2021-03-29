class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :initiate_movie, only: %i[new create]

  def create
    @movie.assign_attributes(movie_params)
    if @movie.save
      flash[:notice] = 'Movie created !!!!'
      redirect_to movies_path
    else
      flash[:error] = 'Failed to create movie !!!!'
      render :new
    end
  end

  def index
    @movies = Movie.order(:release_date, :id)
  end

  def update
    if @movie.update_attributes(movie_params)
      flash[:notice] = 'Movie updated !!!!'
      redirect_to movies_path
    else
      flash[:error] = 'Failed to update movie !!!!'
      render :edit
    end
  end

  def destroy
    @movie&.destroy
    flash[:notice] = 'Movie deleted !!!!'
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :certificate, :duration, :star_cast, :release_date, :poster)
  end

  def find_movie
    @movie = Movie.find_by(id: params[:id])
  end

  def initiate_movie
    @movie = Movie.new
  end
end
