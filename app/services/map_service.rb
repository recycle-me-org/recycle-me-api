class MapService
  BASE_URL = 'https://maps.googleapis.com/maps/api/'
  KEY = "key=#{ENV['GOOGLE_MAP_KEY']}"
  class << self
    def get_place_info(lat, long, keyword)
      ApiClient.get_data("#{BASE_URL}place/nearbysearch/json?location=#{lat}%2C#{long}&radius=20&keyword=#{keyword}&#{KEY}")
    end
  end
end
