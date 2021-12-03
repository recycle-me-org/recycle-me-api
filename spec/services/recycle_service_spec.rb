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

      results = RecycleService.search_locations(params)

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

    it 'returns list of all materials' do
      results = RecycleService.get_materials

      expect(results).to be_a(Hash)

      expect(results[:num_results]).to be_an(Integer)
      expect(results[:result]).to be_an(Array)

      expect(results[:result].first[:description]).to be_a(String)
      expect(results[:result].first[:material_id]).to be_an(Integer)
      expect(results[:result].first[:long_description]).to be_a(String)
      expect(results[:result].first[:image]).to be_a(String)
      expect(results[:result].first[:family_ids]).to be_an(Array)
      expect(results[:result].first[:family_ids]&.first).to be_an(Integer)
    end
  end
end
