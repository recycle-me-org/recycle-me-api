require 'rails_helper'

RSpec.describe RecycleService, :vcr do
  describe 'searching for materials' do
    it 'returns materials matching query' do
      material = 'battery'
      results  = RecycleService.search_materials(material)

      expect(results).to be_a(Hash)

      expect(results[:num_results]).to be_an(Integer)
      expect(results[:result]).to be_an(Array)

      results[:result].each do |result|
        expect(result[:description]).to be_a(String)
        expect(result[:material_id]).to be_a(Integer)
      end
    end

    it 'returns locations for a material' do
      params = {
        material_id: 104,
        latitude: 33.67,
        longitude: -112.04
      }

      results     = RecycleService.search_locations(params)

      expect(results).to be_a(Hash)

      expect(results[:num_results]).to be_an(Integer)
      expect(results[:result]).to be_an(Array)

      results[:result].each do |r|
        expect(r[:description]).to be_a(String)
        expect(r[:distance]).to be_a(Float)
        expect(r[:latitude]).to be_a(Float)
        expect(r[:longitude]).to be_a(Float)
      end
    end
  end
end


# {
#     "search_time": "00.653081",
#     "num_results": 12,
#     "result": [
#         {
#             "curbside": false,
#             "description": "eGreen IT Solutions",
#             "distance": 7.0,
#             "longitude": -112.11036529435061,
#             "latitude": 33.587015133686904,
#             "location_type_id": 0,
#             "location_id": "Q1RQNVdbXV9AVQ",
#             "municipal": false
#         },
#         {
#             "curbside": false,
#             "description": "Maricopa County Transfer Station - Cave Creek",
#             "distance": 8.0,
#             "longitude": -112.00889446883295,
#             "latitude": 33.78308129118068,
#             "location_type_id": 1,
#             "location_id": "Q1RQNVBfW1xAUg",
#             "municipal": true
#         },
