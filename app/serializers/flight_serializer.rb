class FlightSerializer < ActiveModel::Serializer
  attributes :id, :date, :destination, :capacity

  has_many :passengers, serializer: PassengerSerializer

end
