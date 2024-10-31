class Anime < ApplicationRecord
  belongs_to :studio
  has_many :anime_genres
  has_many :genres, through: :anime_genres
end
