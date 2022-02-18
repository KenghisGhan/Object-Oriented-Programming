# Now that we have a Walkable module, we are given a new challenge.
# Apparently some of our users are nobility, and the regular way of walking simply isn't good enough.
# Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

# We must have access to both name and title because they are needed for other purposes that we aren't showing here.
# byron.name
# => "Byron"
# byron.title
# => "Lord"

module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end

  def walk
    title + ' ' + super
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"