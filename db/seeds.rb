require 'faker'
require 'net/http'
require 'open-uri'

response = Net::HTTP.get(URI('https://tmdb.lewagon.com/movie/top_rated'))
api_hash = JSON.parse(response)
results = api_hash['results']

results.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
