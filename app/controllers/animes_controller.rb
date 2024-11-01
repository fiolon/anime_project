class AnimesController < ApplicationController
  def show
    @anime = Anime.find(params[:id])
  end

  def index
    @animes = Anime.includes(:studio).order("title ASC").page(params[:page]).per(20)
  end

  def search
    if params[:query].present?
      @animes = Anime.where("title LIKE ?", "%#{params[:query]}%")
    else
      @animes = Anime.none
    end
  end
end
