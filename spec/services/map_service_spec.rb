require 'rails_helper'

RSpec.describe MapService, :vcr do
  describe 'searching for locations' do
    it 'returns a list of place ids' do
      lat = 33.587015133686904
      long = -112.11036529435061
      keyword = "eGreen IT Solutions"
      locations = MapService.get_place_info(lat, long, keyword)

      expect(locations).to be_a(Hash)

      expect(locations[:results]).to be_an(Array)
      expect(locations[:results][0][:place_id]).to be_a(String)
    end
  end
end
