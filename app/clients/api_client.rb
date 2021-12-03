class ApiClient
  class << self
    def get_data(url)
      response = Faraday.get(url)
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
