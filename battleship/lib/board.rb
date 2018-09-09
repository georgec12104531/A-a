class Board

  attr_accessor :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

end
