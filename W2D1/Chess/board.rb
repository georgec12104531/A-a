require_relative 'piece'

class Board

  attr_reader :board
  def initialize
    @board = default_board
    fill_board
  end

  def default_board
    Array.new(8) {Array.new(8)}
  end

  def fill_board
    [0,1,6,7].each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = Piece.new
      end
    end
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




end
