# 1. You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# It will return "You will " followed by one of the choices

# 2. We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# It will do the same thing as the last question, just with the choices from the new class, RoadTrip

# 3. How do you find where Ruby will look for a method when that method is called?
#    How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# You can do both by using the .ancestors method on a class. Orange < Taste and HotSauce < Taste

# 4. What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# Add attr_accessor :type and remove the type and type=(t) methods

# 5. There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog"   # local variable
@excited_dog = "excited dog"  # instance variable
@@excited_dog = "excited dog" # class variable

# 6. If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# self.manufacturer is a class method because it is defined being called on self.
# You call the method by typing Television.manufacturer

# 7. If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

# The cats_count variable is a class variable, and it belongs to every instance of that class at the same time with the same value.
# fluffy = Cat.new("furry")
# toaster = Cat.new("cute")
# Cat.cats_count  # 2

# 8. If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?
# class Bingo < Game

# 9. If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# The Bingo class would call its version of play, and Game would call it's own version.

# 10. What are the benefits of using Object Oriented Programming in Ruby?
# Code is generally less repetitive
# Classes allow us to show relationships between objects
# Certain parts of code get access to certain functionality