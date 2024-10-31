class Anime < ApplicationRecord
  belongs_to :studio
  has_many :anime_genres
  has_many :genres, through: :anime_genres

  validates :title, presence: true, uniqueness: true
  validates :synopsis, presence: true, length: { maximum: 1000 }
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1950, less_than_or_equal_to: Date.current.year }
end
