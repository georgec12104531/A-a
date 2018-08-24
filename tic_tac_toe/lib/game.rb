require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :board, :current_player, :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one
    player_one.mark = :X
    player_two.mark = :O
  end

  def play
    current_player.display(board)
    until board.over?
      play_turn
    end

    if game_winner
      game_winner.display(board)
      puts "#{game_winner.name} wins!!!"
    else
      puts "Potato"
    end
  end


  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def game_winner
    return player_one if board.winner == player_one.mark
    return player_two if board.winner == player_two.mark
    nil
  end


  def switch_players!
    self.current_player = current_player
    current_player ==  player_one ? self.current_player = player_two : self.current_player = player_one
  end
end


if $PROGRAM_NAME == __FILE__
  puts "What's your name?"
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  tim = ComputerPlayer.new("Sir Timothy")

  new_game = Game.new(human, tim)
  new_game.play
end
