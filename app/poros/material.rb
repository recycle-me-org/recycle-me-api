class Material
  attr_reader :id, :name

  def initialize(data)
    @id = data[:material_id]
    @name = data[:description]
  end
end
