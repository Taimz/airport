json.extract! passenger, :id, :name, :email, :phone_number, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
