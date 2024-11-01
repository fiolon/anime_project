class AddUrlImageToAnimes < ActiveRecord::Migration[7.2]
  def change
    add_column :animes, :url_image, :string
  end
end
