module Types
  class LocationType < Types::BaseObject
    field :name, String, null: true
    field :lat, Float, null: false
    field :long, Float, null: false
    field :hours, String, null: false
    field :phone, String, null: false
    field :url, String, null: false
    field :distance, Float, null: false
    field :address, String, null: false
  end
end
