require 'json'
require 'faker'
require "open-uri"

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

List.destroy_all
file = URI.open('https://images.unsplash.com/photo-1592724217096-618c2d580826?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZHJhbWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
list = List.new(name: 'Drama')
list.photo.attach(io: file, filename: 'drama.png', content_type: 'image/png')
list.save
