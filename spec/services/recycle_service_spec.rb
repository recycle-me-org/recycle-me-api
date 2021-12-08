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
      material_id = 104
      lat = 33.67
      long = -112.04

      locations = RecycleService.search_locations(material_id, lat, long)

      expect(locations).to be_a(Hash)

      expect(locations[:num_results]).to be_an(Integer)
      expect(locations[:result]).to be_an(Array)

      locations[:result].each do |r|
        expect(r[:description]).to be_a(String)
        expect(r[:distance]).to be_a(Float)
        expect(r[:latitude]).to be_a(Float)
        expect(r[:longitude]).to be_a(Float)
      end
    end

    it 'returns list of all materials' do
      materials = RecycleService.get_materials

      expect(materials).to be_a(Hash)

      expect(materials[:num_results]).to be_an(Integer)
      expect(materials[:result]).to be_an(Array)

      expect(materials[:result].first[:description]).to be_a(String)
      expect(materials[:result].first[:material_id]).to be_an(Integer)
      expect(materials[:result].first[:long_description]).to be_a(String)
      expect(materials[:result].first[:image]).to be_a(String)
      expect(materials[:result].first[:family_ids]).to be_an(Array)
      expect(materials[:result].first[:family_ids]&.first).to be_an(Integer)
    end
  end

  describe 'getting location details' do
    it 'returns location details' do
      location = RecycleService.get_location_details('Q1RQNVdbXlpEVA')

      expect(location).to be_a(Hash)
      expect(location[:num_results]).to eq(1)
      expect(location[:result][:Q1RQNVdbXlpEVA]).to be_a(Hash)
      expect(location[:result][:Q1RQNVdbXlpEVA][:postal_code]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:city]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:province]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:description]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:hours]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:phone]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:address]).to be_a(String)
      expect(location[:result][:Q1RQNVdbXlpEVA][:url]).to be_a(String)
    end
  end
end
