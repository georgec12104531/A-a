require_relative 'piece'
require_relative 'queen'
require_relative 'bishop'
require_relative 'rook'
require_relative 'nullpiece'

class Board

  attr_reader :board
  def initialize
    @board = default_board
    fill_board
  end

  def default_board
    #TODO
    Array.new(8) {Array.new(8)}
  end

  def fill_board
    (2..5).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = NullPiece.instance
      end
    end

    [0,1].each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = Piece.new(:orange, self, [row, col])
      end
    end

    [6,7].each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = Piece.new(:blue, self, [row, col])
      end
    end

    self[[3, 4]] = Rook.new(:orange, self, [3, 4])
  end

  def acc_pos(pos)
    @board[pos]
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at that start positions!" if self[start_pos].nil?
    #TODO
    raise "That's the same spot!" if start_pos == end_pos
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def valid_pos?(piece, pos) # [3,3]
    row, col = pos
    return false unless row.between?(0,7) and col.between?(0,7)
    return false if self[pos].color == piece.color

    # TODO
    true
  end


end

if __FILE__ == $0
  b = Board.new
  queen = b[[3, 4]]
  p b
  p queen.moves
end
