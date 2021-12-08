class RecycleFacade
  class << self
    def search_materials(material)
      materials = RecycleService.search_materials(material)

      materials[:result].map do |r|
        Material.new(r)
      end
    end

    def get_materials
      materials = RecycleService.get_materials

      materials[:result].map do |r|
        MaterialInfo.new(r)
      end
    end

    def search_locations(material_id, location)
      results = Geocoder.search(location)
      lat = results.first.coordinates[0]
      long = results.first.coordinates[1]
      locations = RecycleService.search_locations(material_id, lat, long)

      locations[:result].map do |location|
        details = RecycleService.get_location_details(location[:location_id])
        Location.new(details, location[:distance])
      end
    end
  end
end
