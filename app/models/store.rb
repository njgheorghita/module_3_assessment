class Store
  attr_reader :name, :city, :description, :distance, :phone_number, :type

  def initialize(attrs)
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.create(attrs)
    Store.new(attrs)
  end
end