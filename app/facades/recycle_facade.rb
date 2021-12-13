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
      location_data = RecycleService.search_locations(material_id, lat, long)

      location_data[:result].filter_map do |location|
        details = MapService.get_place_info(location[:latitude], location[:longitude], location[:description])

        Location.new(details[:results][0][:place_id]) unless details[:results].empty?
      end
    end
  end
end
