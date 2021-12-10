require 'rails_helper'

RSpec.describe MapService, :vcr do
  describe 'searching for locations' do
    it 'returns a list of place ids' do
      address = '1600 Amphitheatre Parkway, Mountain View, CA 94043, USA'
      locations = MapService.get_place_id(address)

      expect(locations).to be_a(Hash)

      expect(locations[:results]).to be_an(Array)
      expect(locations[:results][0][:place_id]).to be_a(String)
    end
  end
end
