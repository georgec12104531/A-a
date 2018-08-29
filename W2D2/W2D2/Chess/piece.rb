
class Piece
  attr_reader :color, :board, :pos
  # color - symbol, board - board, pos - array of two Integers
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end


  def moves

  end

  def symbol
    :Q
  end

  def inspect
    "P"
  end

end
