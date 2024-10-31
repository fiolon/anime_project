class AnimesController < ApplicationController
  def show
    @anime = Anime.find(params[:id])
  end

  def index
    @animes = Anime.includes(:studio).order("title DESC")
  end
end
