class Location
  attr_reader :name, :hours, :phone, :url, :lat, :long, :distance

  def initialize(data, distance)
    @data = data[:result].first[1]
    @name = @data[:description]
    @hours = @data[:hours]
    @phone_data = @data[:phone]
    @url = @data[:url]
    @lat = @data[:latitude]
    @long = @data[:longitude]
    @distance = distance
  end

  def address
    "#{@data[:address]}, #{@data[:city]}, #{@data[:province]} #{@data[:postal_code]}"
  end

  def phone
    @phone_data.gsub(/[.]/, '-')
  end
end
