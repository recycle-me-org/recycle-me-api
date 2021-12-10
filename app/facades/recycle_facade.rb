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

      addresses = location_data[:result].map do |address|
        details = RecycleService.get_location_details(address[:location_id])
        format_address(details[:result].first[1])
      end
      addresses.map do |address|
        id = MapService.get_place_info(address)[:results][0][:place_id]
        Location.new(id)
      end
    end

    def format_address(data)
      "#{data[:address]}, #{data[:city]}, #{data[:province]} #{data[:postal_code]}"
    end
  end
end
