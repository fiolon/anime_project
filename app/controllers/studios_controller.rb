class StudiosController < ApplicationController
  def index
    @studios = Studio.all.order('studio_name ASC')
  end

  def show
    @studio = Studio.find(params[:id])
    @animes = @studio.animes
  end
end
