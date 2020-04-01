class Building

  attr_reader :units, :renters

  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    units_with_renters = @units.find_all { |unit| unit.renter != nil}
    units_with_renters.map { |unit| unit.renter.name  }
  end

  def average_rent
    total_rent = @units.sum { |unit| unit.monthly_rent}
    (total_rent.to_f / @units.length).round(1)
  end

  def rented_units
    @units.find_all { |unit| unit.renter != nil}
  end

  def renter_with_highest_rent
    unit = rented_units.max_by { |unit| unit.monthly_rent}
    unit.renter
  end

  def units_by_number_of_bedrooms
    units_by_bedrooms = {}
    units.each do |unit|
      if units_by_bedrooms.keys.include?(unit.bedrooms)
        units_by_bedrooms[unit.bedrooms] << unit.number
      else
      units_by_bedrooms[unit.bedrooms] = [unit.number]
      end
    end
    units_by_bedrooms

    # bedrooms_3 = @units.find_all { |unit| unit.bedrooms == 3}
    # bedrooms_2 = @units.find_all { |unit| unit.bedrooms == 2}
    # bedrooms_1 = @units.find_all { |unit| unit.bedrooms == 1}
    # units_by_bedrooms = {}
    # units_by_bedrooms = { 3 => bedrooms_3.map {|bedroom_3| bedroom_3.number},
    #                       2 => bedrooms_2.map {|bedroom_2| bedroom_2.number},
    #                       1 => bedrooms_1.map {|bedroom_1| bedroom_1.number}}
    # units_by_bedrooms
  end

  def annual_breakdown
    breakdown = {}
    rented_units.map do |rented_unit|
      breakdown[rented_unit.renter.name] = rented_unit.monthly_rent * 12
    end
    breakdown
  end

  def rooms_by_renter
    renter_rooms = {}
    rented_units.map do |rented_unit|
      renter_rooms[rented_unit.renter] = {bathrooms: rented_unit.bathrooms, bedrooms: rented_unit.bedrooms}
    end
    renter_rooms
  end
end
