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
end
