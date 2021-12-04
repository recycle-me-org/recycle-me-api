class RecycleFacade
  class << self
    def search_materials(material)
      materials = RecycleService.search_materials(material)

      materials[:result].map do |r|
        Material.new(r)
      end
    end
  end
end
