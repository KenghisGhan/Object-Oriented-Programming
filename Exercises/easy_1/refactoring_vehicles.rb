# Consider the following classes:
# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def to_s
    "#{make} #{model}"
end

class Car < Vehicle
  def initialize(make, model)
    super(make, model, 4)
  end
end

class Motorcycle
  def initialize(make, model)
    super(make, model, 2)
  end
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, 6)
    @payload = payload
  end
end