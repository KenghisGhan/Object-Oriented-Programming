# Write a class that will display:

# ABC
# xyz

# When the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def uppercase
    string.upcase
  end

  def self.lowercase(other_string)
    other_string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')