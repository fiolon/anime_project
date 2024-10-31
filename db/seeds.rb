require 'httparty'

AnimeGenre.delete_all
Genre.delete_all
Anime.delete_all
Studio.delete_all

(1..200).each do |anime_id|
  response = HTTParty.get("https://api.jikan.moe/v4/anime/#{anime_id}")

  # Check if response is successful
  if response.code == 200
    anime_data = response.parsed_response['data']

    # Extract studio data from API
    studio_data = anime_data['studios'].first
    studio = Studio.find_or_create_by(studio_name: studio_data['name']) if studio_data

    # Extract genre data from API
    genre_records = anime_data['genres'].map do |genre|
      Genre.find_or_create_by(genre_name: genre['name'])
    end

    anime = Anime.create(
      title: anime_data['title'],
      synopsis: anime_data['synopsis'],
      score: anime_data['score'],
      year: anime_data['year'],
      studio: studio
    )

    anime.genres << genre_records

    puts "Genre, studio and anime added: #{anime_id}"
  else
    puts "Anime ID #{anime_id} - failed to fetch studio, anime and genre"
  end
end

puts "Created #{Genre.count} Genres"
puts "Created #{Studio.count} Studios"
puts "Created #{Anime.count} Animes"