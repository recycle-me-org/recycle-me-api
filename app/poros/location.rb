class Location
  attr_reader :long, :lat, :name

  def initialize(data)
    @long = data[:longitude]
    @lat = data[:latitude]
    @name = data[:description]
  end
end
