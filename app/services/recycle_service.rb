class RecycleService
  BASE_URL = 'http://api.earth911.com/earth911.'

  class << self
    def search_materials(material)
      results = ApiClient.get_data("#{BASE_URL}searchMaterials?api_key=#{ENV['EARTH911_KEY']}&query=#{material}")
    end
  end
end
