module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :search_materials, [Types::MaterialType], null: false do
      argument :search, String, required: true
    end

    def search_materials(search:)
      RecycleFacade.search_materials(search)
    end

    field :search_locations, [Types::LocationType], null: false do
      argument :materialId, String, required: true
      argument :location, String, required: true
    end

    def search_locations(materialId:, location:)
      RecycleFacade.search_locations(materialId, location)
    end

    field :materials, [Types::MaterialInfoType], null: false

    def materials
      Rails.cache.fetch("material-list", expires_in: 7.days) do
        RecycleFacade.get_materials
      end
    end
  end
end
