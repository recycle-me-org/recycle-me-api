require 'rails_helper'

RSpec.describe Location do
  it 'has attributes' do
    info = {
                longitude: -112.04,
                latitude: 33.67,
                description: "description",
            }


    location = Location.new(info)

    expect(location).to be_a(Location)
    expect(location.long).to eq(info[:longitude])
    expect(location.lat).to eq(info[:latitude])
    expect(location.name).to eq(info[:description])
  end
end
