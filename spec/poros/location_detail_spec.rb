require 'rails_helper'

RSpec.describe LocationDetail do
  it 'has attributes' do
    details = LocationDetail.new(location_info)
    data = location_info[:result].first[1]
    address =   "#{data[:address]}, #{data[:city]}, #{data[:province]} #{data[:postal_code]}"

    expect(details).to be_a(LocationDetail)
    expect(details.address).to eq(address)
    expect(details.name).to eq(data[:description])
    expect(details.hours).to eq(data[:hours])
    expect(details.phone).to eq(data[:phone])
    expect(details.url).to eq(data[:url])
  end
end
