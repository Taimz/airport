json.extract! flight, :id, :capacity, :date, :destination, :created_at, :updated_at
json.url flight_url(flight, format: :json)
