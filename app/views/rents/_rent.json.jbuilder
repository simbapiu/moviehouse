json.extract! rent, :id, :user_id, :movie_id, :price, :rent_day, :return_day, :created_at, :updated_at
json.url rent_url(rent, format: :json)
