class RecycleService
  BASE_URL = 'http://api.earth911.com/earth911.'
  KEY = "api_key=#{ENV['EARTH911_KEY']}"

  class << self
    def search_materials(material)
      ApiClient.get_data("#{BASE_URL}searchMaterials?#{KEY}&query=#{material}")
    end

    def get_materials
      ApiClient.get_data("#{BASE_URL}getMaterials?#{KEY}")
    end

    def search_locations(material_id, lat, long)
      ApiClient.get_data("#{BASE_URL}searchLocations?#{KEY}&material_id=#{material_id}&longitude=#{long}&latitude=#{lat}")
    end

    def get_location_details(location_id)
      ApiClient.get_data("#{BASE_URL}getLocationDetails?#{KEY}&location_id=#{location_id}")
    end
  end
end
