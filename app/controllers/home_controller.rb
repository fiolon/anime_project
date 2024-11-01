class HomeController < ApplicationController
  def index
    @animes = Anime.includes(:studio).order("score DESC").page(params[:page]).per(20)
  end
end
