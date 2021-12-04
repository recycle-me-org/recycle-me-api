class RecycleFacade
  class << self
    def search_materials(material)
      materials = RecycleService.search_materials(material)

      materials[:result].map do |r|
        Material.new(r)
      end
    end

    def search_locations(params)
      results = Geocoder.search(params[:location])
      lat = results.first.coordinates[0]
      long = results.first.coordinates[1]
      locations = RecycleService.search_locations(params[:material_id], lat, long)

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
