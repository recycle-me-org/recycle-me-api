require 'rails_helper'

RSpec.describe MaterialInfo do
  it 'has attributes' do
    info = {
                description: "Acids",
                image: "materials/1-plastic-bags.jpg",
                long_description: "Long Acids",
                material_id: 503
            }

    material = MaterialInfo.new(info)

    expect(material).to be_a(MaterialInfo)
    expect(material.id).to eq(info[:material_id])
    expect(material.name).to eq(info[:description])
    expect(material.description).to eq(info[:long_description])
    expect(material.image_url).to eq(info[:image])
  end
end
