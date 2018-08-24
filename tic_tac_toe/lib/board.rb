class Board

  attr_accessor :grid

  def initialize(grid=default_grid)
    @grid = grid
  end

  def default_grid
    Array.new(3) { Array.new(3) }
  end

  def place_mark(pos, mark)
    row, col = pos[0], pos[1]
    @grid[row][col] = mark
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def empty?(pos)
    row, col =  pos[0], pos[1]
    @grid[row][col] == nil ? true : false
  end
  #
  def winner
    (grid + col + diagonals).each do |three|
      return :X if three == [:X, :X, :X]
      return :O if three == [:O, :O, :O]
    end
    nil
  end

  def diagonals
    right_diag = [[0, 0], [1, 1], [2, 2]]
    left_diag = [[0, 2], [1, 1], [2, 0]]

    [right_diag, left_diag].map do |diag|
      diag.map { |row, col| grid[row][col] }
    end
  end

  def col
    final_array = []
    (0..2).each do |i|
      col = []
      (0..2).each do |j|
        col << grid[j][i]
      end
      final_array << col
    end
    final_array
  end

  def over?
    grid.flatten.none? { |space| space == nil } || winner
  end

end
