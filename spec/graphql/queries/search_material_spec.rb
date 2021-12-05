require 'rails_helper'

# module Queries

  RSpec.describe Material, :vcr, type: :request do
    describe '.resolve' do
      it 'returns materials for given search query' do
        post '/graphql', params: { query: query(search: 'battery')}

        json = JSON.parse(response.body)
        data = json['data']['searchMaterials']

        expect(data).to match_array [
          {"id"=>503, "name"=>"Acids"},
          {"id"=>104, "name"=>"Alkaline Batteries"},
          {"id"=>127, "name"=>"Button Cell Batteries"},
          {"id"=>368, "name"=>"Car Fluids"},
          {"id"=>689, "name"=>"Lithium Batteries"},
          {"id"=>6, "name"=>"Lithium-ion Batteries"},
          {"id"=>126, "name"=>"Nickel-cadmium Batteries"},
          {"id"=>685, "name"=>"Nickel-metal Hydride Batteries"},
          {"id"=>687, "name"=>"Nickel-zinc Batteries"},
          {"id"=>691, "name"=>"Zinc-carbon Batteries"}
        ]
      end
    end

    def query(search:)
      <<~GQL
        query {
          searchMaterials(search: "#{search}") {
            id
            name
          }
        }
      GQL
    end
  end
# end
