class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms
  attr_accessor :renter

  def initialize(apartment)
    @number = apartment[:number]
    @monthly_rent = apartment[:monthly_rent]
    @bathrooms = apartment[:bathrooms]
    @bedrooms = apartment[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end
end
