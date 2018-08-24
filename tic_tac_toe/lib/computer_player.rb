class ComputerPlayer
  attr_accessor :board, :mark, :grid

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |i|
      (0..2).each do |j|
        pos = [i, j]
        moves << pos if board[pos].nil?
      end
    end
    moves.each do |move|
      return move if wins?(move)
    end
    moves.sample
  end

  def wins?(move)
    board[move] = mark
    if board.winner == mark
      reset_space(move)
      true
    else
      reset_space(move)
      false
    end
  end

  def reset_space(pos)
    board[pos] = nil
  end

end
