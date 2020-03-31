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
    units_with_renters = @units.find_all { |unit|unit.renter != nil}
    units_with_renters.map { |unit| unit.renter.name  }
  end
end
