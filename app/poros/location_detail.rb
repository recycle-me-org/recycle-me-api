class LocationDetail
  attr_reader :name, :hours, :phone, :url

  def initialize(data)
    @data = data[:result].first[1]
    @name = @data[:description]
    @hours = @data[:hours]
    @phone = @data[:phone]
    @url = @data[:url]
  end

  def address
    "#{@data[:address]}, #{@data[:city]}, #{@data[:province]} #{@data[:postal_code]}"
  end
end
