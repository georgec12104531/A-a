# There are six different peg colors. A hash containing the colors has been provided in the code. The colors are:
# Red
# Green
# Blue
# Yellow
# Orange
# Purple
# The computer will generate a random code of four pegs. (Duplicate colors are allowed.)
# The user gets ten turns to guess the code.
# You decide how the user inputs his guess (maybe like so: "RGBY" for red-green-blue-yellow)
# The computer should tell the player how many exact matches (right color in right spot) and near matches (right color, wrong spot) he or she has.
# The game ends when the user guesses the code, or is out of turns.
#
#

class Code
  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  PEGS = {
    "B" => :blue,
    "G" => :green,
    "O" => :orange,
    "P" => :purple,
    "R" => :red,
    "Y" => :yellow
  }

  def self.parse(input)
    # Accepts both uppercase and lowercase inputs
    # When given a string containing invalid colors if raises an error
    pegs = input.chars.map do |letter|
      raise "parse error" unless PEGS.has_key?(letter.upcase)
      PEGS[letter.upcase]
    end
    Code.new(pegs)
  end

  def self.random
    rand_pegs = []
    4.times do |time|
      rand_pegs << PEGS.values.sample
    end
    Code.new(rand_pegs)
  end

  def [](i)
    pegs[i]
  end

  def exact_matches(other)
    same_same = 0
    (0..3).each do |i|
      current_peg = other[i]
      og_peg = pegs[i]
      same_same += 1 if current_peg == og_peg
    end
    same_same
  end

  def near_matches(other)
    same_different = []
    (0..3).each do |i|
      current_peg = other[i]
      og_peg = pegs[i]
      same_different << current_peg if pegs.include?(current_peg) and current_peg != og_peg
    end
    same_different.uniq.count
  end

  def ==(other)
    return false unless other.is_a?(Code)
    self.pegs == other.pegs
  end

end

class Game

  TURNS = 10

  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess
    puts "Guess the code:"
    begin
      guess = gets.chomp
      Code.parse(guess)
    rescue
      puts "no way jose"
      retry
    end
  end

  def display_matches(guess)
    near = @secret_code.near_matches(guess)
    exact = @secret_code.exact_matches(guess)

    puts "You have #{near} near matches!"
    puts "You have #{exact} exact matches!"

  end

  def play
    TURNS.times do |turn|
      guess = get_guess
      if guess == @secret_code
        return "Wow pepe"
      end
      display_matches(guess)
    end
    puts "Sorry bud :/, the answer was #{@secret_code.pegs.map(&:to_s)}"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
