require 'pry'

class History
  attr_accessor :log, :game_count

  def initialize
    @log = {}
    @game_count = 1
  end

  def add_game(events)
    log.store("Game #{game_count}:", events)
    self.game_count += 1
  end

  def display_games
    log.each do |game, events|
      puts game
      events.each { |event| puts event }
      puts
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_moves
    events = ["#{human.name} chose #{human.move}."]
    puts events << "#{computer.name} chose #{computer.move}."
    history.add_game(events)
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.increase_score
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.increase_score
    else
      puts "It's a tie!"
    end
    binding.pry
  end

  def play_again?
    if human.score == 10
      puts "#{human.name} won the match!"
      return false
    elsif computer.score == 10
      puts "#{computer.name} won the match!"
      return false
    end

    true
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    super('rock')
  end

  def >(other_move)
    return true if other_move.to_s == 'scissors' || other_move.to_s == 'lizard'
    false
  end

  def <(other_move)
    return true if other_move.to_s == 'paper' || other_move.to_s == 'spock'
    false
  end
end

class Paper < Move
  def initialize
    super('paper')
  end

  def >(other_move)
    return true if other_move.to_s == 'rock' || other_move.to_s == 'spock'
    false
  end

  def <(other_move)
    return true if other_move.to_s == 'scissors' || other_move.to_s == 'lizard'
    false
  end
end

class Scissors < Move
  def initialize
    super('scissors')
  end

  def >(other_move)
    return true if other_move.to_s == 'paper' || other_move.to_s == 'lizard'
    false
  end

  def <(other_move)
    return true if other_move.to_s == 'rock' || other_move.to_s == 'spock'
    false
  end
end

class Lizard < Move
  def initialize
    super('lizard')
  end

  def >(other_move)
    return true if other_move.to_s == 'spock' || other_move.to_s == 'paper'
    false
  end

  def <(other_move)
    return true if other_move.to_s == 'rock' || other_move.to_s == 'scissors'
    false
  end
end

class Spock < Move
  def initialize
    super('spock')
  end

  def >(other_move)
    return true if other_move.to_s == 'scissors' || other_move.to_s == 'rock'
    false
  end

  def <(other_move)
    return true if other_move.to_s == 'paper' || other_move.to_s == 'lizard'
    false
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increase_score
    @score += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    case choice
    when 'rock'
      self.move = Rock.new
    when 'paper'
      self.move = Paper.new
    when 'scissors'
      self.move = Scissors.new
    when 'lizard'
      self.move = Lizard.new
    when 'spock'
      self.move = Spock.new
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case Move::VALUES.sample
    when 'rock'
      self.move = Rock.new
    when 'paper'
      self.move = Paper.new
    when 'scissors'
      self.move = Scissors.new
    when 'lizard'
      self.move = Lizard.new
    when 'spock'
      self.move = Spock.new
    end
  end
end

RPSGame.new.play
