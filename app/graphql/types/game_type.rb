module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :score, Integer, null: true
  end
end
