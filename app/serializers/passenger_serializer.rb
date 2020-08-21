class PassengerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number

  has_many :flights, serializer: FlightSerializer
end
