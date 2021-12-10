require 'rails_helper'

RSpec.describe Location do
  it 'has attributes' do
    location = Location.new('fghfghfgh')

    expect(location).to be_a(Location)
    expect(location.place_id).to eq('fghfghfgh')
  end
end
