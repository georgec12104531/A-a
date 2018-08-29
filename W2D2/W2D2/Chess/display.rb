require_relative 'cursor'
require 'colorize'
require_relative 'board'

class Display

  #TODO
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts " 1 2 3 4 5 6 7 8"
    separator
    (0..7).each do |row_index|
      row(row_index) # puts
      separator
    end
  end

  def separator
    puts "_________________"
  end

  def row(x) # [x, ]
    row_string = "#{x+1} |"
    row_pieces = @board.acc_pos(x)
    row_pieces.each_with_index do |piece, y|
      if @cursor.cursor_pos == [x,y]
        if piece.symbol == nil
          row_string << " |".colorize(:background => :red)
        else
          row_string << "#{piece.symbol.to_s}|".colorize(:background => :red)
        end
      elsif !piece.symbol.nil?
         row_string << "#{piece.symbol.to_s}|"
      else
        row_string << " |"
      end
    end

    puts row_string
  end

  def play

    until false
      render
      @cursor.get_input
    end
  end

  #TODO
  #

end
