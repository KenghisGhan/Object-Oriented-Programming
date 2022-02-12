class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(miles, gallons)
    miles / gallons
  end

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "You accelerate #{number} mph"
  end

  def brake(number)
    @speed -= number
    puts "You decelerate #{number} mph"
  end

  def shut_off
    @speed = 0
    puts "You stop the car and shut it off"
  end

  def spray_paint(color)
    self.color = color
  end

  private

  def age
    (Time.now - Time.new(self.year)).to_i / 60 / 60 / 24 / 7 / 52
  end
end

module FourWheelDrive
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class MyCar < Vehicle
  BED = false

  def initialize(year, color, model)
    super
  end

  def to_s
    "The car is a #{year} #{model} that is #{color}"
  end
end

class MyTruck < Vehicle
  include FourWheelDrive
  BED = true

  def initialize(year, color, model)
    super
  end
end