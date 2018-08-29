require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def move_dir
    Slideable::HORIZONTAL_DIR
  end
end
