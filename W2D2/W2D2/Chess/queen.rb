require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def move_dir
    Slideable::HORIZONTAL_DIR + Slideable::DIAGONAL_DIR
  end
end
