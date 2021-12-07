require 'rails_helper'

RSpec.describe 'get materials endpoint', :vcr, type: :request do
  it 'returns a list of all materials' do
    post '/graphql', params: { query: query }

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:materials]

    data.each do |d|
      expect(d[:id]).to          be_a(String)
      expect(d[:name]).to        be_a(String)
      expect(d[:description]).to be_a(String)
      expect(d[:image_url]).to   be_a(String).or be_nil
    end
  end

  def query
    <<~GQL
      query {
        materials {
          id
          name
          description
          imageUrl
        }
      }
    GQL
  end
end
