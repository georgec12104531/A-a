class Hangman
  MAX_GUESSES = 8

  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @num_remaining_guesses = MAX_GUESSES
  end

  def play
    setup

    while @num_remaining_guesses > 0
      p @board
      take_turn
      if won?
        p @board
        puts "Guesser Wins!!!"
        puts "The word is indeed: #{@referee.require_secret}"
        break
      end
    end
    puts "You lose :/"
    puts "The word was #{@referee.require_secret}"
    nil
  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = [nil] * secret_length
  end

  def take_turn
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    update_board(indices, guess)
    @num_remaining_guesses -= 1 if indices.empty?
    @guesser.handle_response(guess, indices)
  end

  def update_board(indices, guess)
    indices.each do |idx|
      @board[idx] = guess
    end
  end

  def won?
    @board.all?
  end

end

class HumanPlayer

  def register_secret_length(length)
    puts "Secret is #{length} letters long"
  end
  def guess(board)
    puts "Hey player what's your guess?"
    gets.chomp
  end

  def handle_response(guess, indices)
    puts "#{guess} is at positions #{indices}"
  end

  def pick_secret_word
    puts "Pick a secret word, how long is it?"

    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Enter a valid length"
      retry
    end
  end

  def check_guess(guess)
    puts "Player guessed #{guess}"
    puts "What positions does that occur at?"

    gets.chomp.split(",").map { |i_str| Integer(i_str) }
  end

  def require_secret
    puts "What word were you thinking of"
    gets.chomp
  end

end

class ComputerPlayer
  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end

  attr_accessor :dictionary, :candidate_words

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    indices = Array.new
    (0...@secret_word.length).each do |i|
      indices << i if @secret_word[i] == letter
    end
    indices
  end

  def register_secret_length(length)
    @candidate_words = @dictionary.select { |word| word if word.length == length }
  end

  def guess(board)
    freq_table = freq_table(board)
    most_freq_letter = freq_table.sort_by { |letter, count| count }
    letter =  most_freq_letter.last.first
  end

  def handle_response(letter, indices)
    indices_count = indices.count
    final_candidates = Array.new
    if indices.empty?
      @candidate_words.each do |word|
        word_indices_count = word.count(letter)
        if !word.include?(letter) and word_indices_count == indices_count
          final_candidates << word
        end
      end
      return @candidate_words = final_candidates
    else
      candidate_words.each do |word|
        word_indices_count = word.count(letter)
        if indices.all? { |i| word[i] == letter } and word_indices_count == indices_count
          final_candidates << word
        end
      end
      @candidate_words = final_candidates
    end
  end

  def require_secret
    @secret_word
  end

  def freq_table(board)
  freq_hash = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |letter, idx|
        freq_hash[word[idx]] += 1 if letter.nil?
      end
    end
    freq_hash
  end

end


if __FILE__ == $PROGRAM_NAME
  print "Guesser: Computer ? (yes/no) "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    guesser = HumanPlayer.new
  end

  print "Referee: Computer ? (yes/no) "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    referee = HumanPlayer.new
  end
  Hangman.new({guesser: guesser, referee: referee}).play
end
