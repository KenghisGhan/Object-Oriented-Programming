# Behold this incomplete class for constructing boxed banners.
# Complete this class so that the test cases shown below work as intended.
# You are free to add any methods or instance variables you need.
# However, do not make the implementation details public.

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    banner_line('+', '-')
  end

  def empty_line
    banner_line('|', ' ')
  end

  def message_line
    "| #{@message} |"
  end

  private

  def banner_line(ends, char)
    ends + (char * (@message.length + 2)) + ends
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner