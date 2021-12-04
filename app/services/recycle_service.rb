class RecycleService
  BASE_URL = 'http://api.earth911.com/earth911.'

  class << self
    def search_materials(material)
      ApiClient.get_data("#{BASE_URL}searchMaterials?api_key=#{ENV['EARTH911_KEY']}&query=#{material}")
    end

    def search_locations(material_id, lat, long)
      ApiClient.get_data("#{BASE_URL}searchLocations?api_key=#{ENV['EARTH911_KEY']}&material_id=#{material_id}&longitude=#{long}&latitude=#{lat}")
    end

    def get_materials
      ApiClient.get_data("#{BASE_URL}getMaterials?api_key=#{ENV['EARTH911_KEY']}")
    end
  end
end
