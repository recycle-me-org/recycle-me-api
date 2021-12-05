module Types
  class MaterialType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: true
  end
end
