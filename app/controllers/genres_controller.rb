class GenresController < ApplicationController
  def index
    @genres = Genre.all.order("genre_name ASC")
  end

  def show
    @genre = Genre.find(params[:id])
    @animes = @genre.animes
  end
end
