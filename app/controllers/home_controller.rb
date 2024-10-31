class HomeController < ApplicationController
  def index
    @animes = Anime.includes(:studio)
                   .order("score DESC")
                   .limit(20)
  end
end
