# 1. Given this class:
# One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors.
# For example, bulldogs can't swim, but all other dogs can.
# Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

# 2. Let's create a few more methods for our Dog class.
# Create a new class called Cat, which can do everything a dog can, except swim or fetch.
# Assume the methods do the exact same thing.
# Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

# 3. Draw a class hierarchy diagram of the classes from step #2

#          Animal
#          run, jump
#         /      \
#       Dog      Cat
#       speak,   speak,
#       fetch,
#       swim

# 4. What is the method lookup path and how is it important?
# The method path lookup is the order in which classes are checked for methods that are being invoked.
# It is important because it may explain why a certain method in a higher class is being called the way it is.
