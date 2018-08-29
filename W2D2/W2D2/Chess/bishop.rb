require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def move_dir
    Slideable::DIAGONAL_DIR
  end
end
