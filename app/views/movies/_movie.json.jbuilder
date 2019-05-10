json.extract! movie, :id, :code, :name, :year, :genre, :created_at, :updated_at
json.url movie_url(movie, format: :json)
