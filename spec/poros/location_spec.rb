require 'rails_helper'

RSpec.describe Location do
  it 'has attributes' do
    details = Location.new(location_info, 5)
    data = location_info[:result].first[1]
    address =   "#{data[:address]}, #{data[:city]}, #{data[:province]} #{data[:postal_code]}"

    expect(details).to be_a(Location)
    expect(details.address).to eq(address)
    expect(details.name).to eq(data[:description])
    expect(details.hours).to eq(data[:hours])
    expect(details.phone).to eq(data[:phone])
    expect(details.phone.length).to eq(12)
    expect(details.url).to eq(data[:url])
    expect(details.lat).to eq(data[:latitude])
    expect(details.long).to eq(data[:longitude])
    expect(details.distance).to eq(5)
  end
end
