class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_genres

  private

  def load_genres
    @genres = Genre.all.order("genre_name ASC")
  end
end
