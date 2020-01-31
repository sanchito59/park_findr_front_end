json.extract! location, :id, :continent, :country, :city, :community, :street_address, :longitude, :latitude, :created_at, :updated_at
json.url location_url(location, format: :json)
