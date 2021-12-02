module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :games, [Types::GameType], null: true
    field :game_count, Integer, null: true
    field :highest_score, Integer, null: true

    def game_count
      object.games.count
    end

    def highest_score
      object.games
            .maximum(:score)
    end
  end
end
