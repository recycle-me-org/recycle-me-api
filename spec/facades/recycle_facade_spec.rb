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
      material_id = 104
      location = "80217, United States"

      results = RecycleFacade.search_locations(material_id, location)

      expect(results).to be_a(Array)
      expect(results.size).to eq(6)
    end

    it 'returns list of all materials' do
      results = RecycleFacade.get_materials

      expect(results).to be_a(Array)
      expect(results.size).to eq(376)
      results.each do |r|
        expect(r).to be_a(MaterialInfo)
      end
    end
  end
end
