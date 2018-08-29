require_relative 'piece'
require_relative 'slideable'
require 'singleton'

class NullPiece < Piece
  include Singleton
  #TODO

  def initialize
    super(:null, nil, nil)
  end

  def symbol
    nil
  end

  def inspect
    "N"
  end

end
