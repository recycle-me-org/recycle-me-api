class MapService
  BASE_URL = 'https://maps.googleapis.com/maps/api/'
  KEY = "key=#{ENV['GOOGLE_MAP_KEY']}"
  class << self
    def get_place_info(address)
      ApiClient.get_data("#{BASE_URL}geocode/json?address=#{address}&#{KEY}")
    end
  end
end
