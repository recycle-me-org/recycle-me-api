require 'rails_helper'

RSpec.describe 'searching locations', :vcr, type: :request do
  describe 'search' do
    it 'returns locations for given search query' do
      post '/graphql', params: { query: query(materialId: 104, location: '80031, United States') }

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:searchLocations]

      expect(data).to match_array [
        {:name=>"Metech Recycling", :long=>-104.99239601388138, :lat=>39.79466906925231},
        {:name=>"SustainAbility Recycling", :long=>-104.9898749995828, :lat=>39.6934847226322},
        {:name=>"Jefferson County Rooney Road Recycling Center", :long=>-105.20175479222218, :lat=>39.711418301619794},
        {:name=>"Genesis Electronics Recycling", :long=>-104.8922429912925, :lat=>39.67996291866711},
        {:name=>"Weld County Household Hazardous Waste South Facility", :long=>-104.95068468639585, :lat=>40.08676295320999},
        {:name=>"Whole Foods Market", :long=>-104.90163949913264, :lat=>39.65240364872132},
        {:name=>"Gilpin County Recycling and Electonic Waste Drop-off Facility", :long=>-105.46468512440771, :lat=>39.86972654041444},
        {:name=>"Tree and Styrofoam Recycling (EAS+Y)", :long=>-105.31881006976741, :lat=>39.60799941959868}
      ]
    end
  end

  def query(materialId:, location:)
    <<~GQL
      query {
        searchLocations(materialId: "#{materialId}", location: "#{location}") {
          name
          long
          lat
        }
      }
    GQL
  end
end
