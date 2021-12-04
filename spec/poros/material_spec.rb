require 'rails_helper'

RSpec.describe Material do
  it 'has attributes' do
    info = {
                url: "",
                exact: false,
                description: "Acids",
                material_id: 503
            }

    material = Material.new(info)

    expect(material).to be_a(Material)
    expect(material.id).to eq(info[:material_id])
    expect(material.name).to eq(info[:description])
  end
end
