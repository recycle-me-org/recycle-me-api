require 'rails_helper'

RSpec.describe RecycleFacade, :vcr do
  describe 'searching for materials' do
    it 'returns list of material names and ids' do
      material = 'battery'
      results  = RecycleFacade.search_materials(material)

      expect(results).to be_an(Array)
      expect(results.size).to eq(10)
      results.each do |r|
        expect(r).to be_a(Material)
      end
    end

    it 'returns locations for a material' do
      params = {
        material_id: 104,
        latitude: 33.67,
        longitude: -112.04
      }
      results = RecycleFacade.search_locations(params)

      expect(results).to be_a(Array)
      expect(results.size).to eq(12)
      results.each do |r|
        expect(r).to be_a(Location)
      end
    end
  end
end
