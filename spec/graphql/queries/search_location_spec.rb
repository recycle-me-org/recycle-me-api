require 'rails_helper'

RSpec.describe 'searching locations', :vcr, type: :request do
  describe 'search' do
    it 'returns locations for given search query' do
      post '/graphql', params: { query: query(materialId: 104, location: '80217, United States') }

      json = JSON.parse(response.body, symbolize_names: true)
      locations = json[:data][:searchLocations]

      expect(locations).to be_an(Array)

      locations.each do |location|
        expect(location[:placeId]).to be_a(String)
      end
    end
  end

  def query(materialId:, location:)
    <<~GQL
      query {
        searchLocations(materialId: "#{materialId}", location: "#{location}") {
          placeId
        }
      }
    GQL
  end
end
