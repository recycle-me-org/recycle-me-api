module Types
  class LocationType < Types::BaseObject
    field :name, String, null: true
    field :lat, Float, null: false
    field :long, Float, null: false
  end
end
