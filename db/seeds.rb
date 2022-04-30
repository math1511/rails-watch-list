require 'json'

TOP_STORIES_URL = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>"

Movie.destroy_all

movies = JSON.parse(RestClient.get(TOP_STORIES_URL))

movies['results'].each do |m|
  movie = Movie.new(
    title: m['original_title'],
    overview: m['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}",
    rating: m['vote_average']
  )
  movie.save
  puts movie
end
