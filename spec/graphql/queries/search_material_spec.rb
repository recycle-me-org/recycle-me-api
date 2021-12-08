require 'rails_helper'

  RSpec.describe Material, :vcr, type: :request do
    describe '.resolve' do
      it 'returns materials for given search query' do
        post '/graphql', params: { query: query(search: 'battery')}

        json = JSON.parse(response.body, symbolize_names: true)
        materials = json[:data][:searchMaterials]

        expect(materials).to be_an(Array)

        materials.each do |material|
          expect(material[:id]).to be_an(Integer)
          expect(material[:name]).to be_a(String)
        end
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
