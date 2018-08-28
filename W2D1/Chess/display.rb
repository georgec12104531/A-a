require_relative 'cursor'


class Display

  #TODO
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end



end
