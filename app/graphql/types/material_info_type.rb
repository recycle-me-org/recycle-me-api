module Types
  class MaterialInfoType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :image_url, String, null: true
  end
end
