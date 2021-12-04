class MaterialInfo
  attr_reader :id, :name, :description, :image_url

  def initialize(data)
    @id = data[:material_id]
    @name = data[:description]
    @description = data[:long_description]
    @image_url = data[:image]
  end
end
