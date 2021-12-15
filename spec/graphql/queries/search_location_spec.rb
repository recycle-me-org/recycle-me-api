require 'rails_helper'

RSpec.describe 'searching locations', :vcr, type: :request do
  describe 'search' do
    it 'returns locations for given search query' do
      post '/graphql', params: { query: query(materialId: 104, location: '80031, United States') }

      json = JSON.parse(response.body, symbolize_names: true)
      locations = json[:data][:searchLocations]

      expect(locations).to be_an(Array)

      locations.each do |location|
        expect(location[:name]).to be_a(String)
        expect(location[:hours]).to be_a(String)
        expect(location[:phone]).to be_a(String)
        expect(location[:url]).to be_a(String)
        expect(location[:lat]).to be_a(Float)
        expect(location[:long]).to be_a(Float)
        expect(location[:distance]).to be_a(Float)
      end
    end
  end

  def query(materialId:, location:)
    <<~GQL
      query {
        searchLocations(materialId: "#{materialId}", location: "#{location}") {
          name
          long
          lat
          hours
          phone
          url
          distance
          address
        }
      }
    GQL
  end
end
