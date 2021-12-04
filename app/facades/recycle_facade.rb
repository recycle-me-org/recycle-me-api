class RecycleFacade
  class << self
    def search_materials(material)
      materials = RecycleService.search_materials(material)

      materials[:result].map do |r|
        Material.new(r)
      end
    end

    def search_locations(params)
      locations = RecycleService.search_locations(params)

      locations[:result].map do |r|
        Location.new(r)
      end
    end

    def get_materials
      materials = RecycleService.get_materials
      
      materials[:result].map do |r|
        MaterialInfo.new(r)
      end
    end
  end
end
