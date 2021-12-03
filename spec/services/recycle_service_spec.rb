require 'rails_helper'

RSpec.describe RecycleService, :vcr do
  describe 'searching for materials' do
    it 'returns materials matching query' do
      material = 'battery'
      results = RecycleService.search_materials(material)

      expect(results).to be_a(Hash)

      expect(results[:num_results]).to be_an(Integer)
      expect(results[:result]).to be_an(Array)

      results[:result].each do |result|
        expect(result[:description]).to be_a(String)
        expect(result[:material_id]).to be_a(Integer)
      end
    end
  end
end
