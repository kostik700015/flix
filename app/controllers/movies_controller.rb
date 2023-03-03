class MoviesController < ApplicationController

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def new
    @movie = Movie.new
  end

  def update 
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :released_on, :total_gross, :rating, :director, :duration, :image_file_name)
  end

end
