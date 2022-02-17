# 1. Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

class Person
  attr_accessor :first_name, :last_name

  def intialize(full_name)
    @first_name = full_name.split.first
    @last_name = full_name.split > 1 ? full_name.split.last : ''
  end

  def name
    @first_name + ' ' + @last_name
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name, :full_name

  def intialize(full_name)
    @first_name = full_name.split.first
    @last_name = full_name.split > 1 ? full_name.split.last : ''
  end

  def name
    @first_name + ' ' + @last_name
  end

  def name=(full_name)
    if full_name.split.size == 1
      @first_name = full_name.strip
    else
      @first_name = full_name.split.first
      @last_name = full_name.split.last
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
# We can compare the two objects by comparing bob.name and rob.name

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# It would print out the result of bob.to_s

# If we add a to_s method to the class that outputs the name, it will output what we expect.