MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0],
  left_up: [-1,-1],
  left_down: [1,-1],
  right_up: [-1,1],
  right_down: [1,1]
}
# MOVES
module Slideable

  HORIZONTAL_DIR = [:left, :right, :up, :down]
  DIAGONAL_DIR = [:left_up, :left_down, :right_up, :right_down]

  def moves
     # pos, move_directions, board
    poss_moves = []
    move_dir.each do |direction|
      diff = MOVES[direction]
      poss_moves += grow_unblocked_moves_in_dir(diff)
    end

    poss_moves
  end

  def horizontal_dir
    HORIZONTAL_DIR
  end

  def diagonal_dir
    DIAGONAL_DIR
  end


  private
  def grow_unblocked_moves_in_dir(diff)
    dx, dy = diff # 0, 1
    curr_pos = self.pos.dup # [3,4] # [3, ]
    possible_moves = [] #

    curr_pos = update_pos(curr_pos, [dx, dy])
    while @board.valid_pos?(self, curr_pos) # is valid
      possible_moves << curr_pos
      curr_pos = update_pos(curr_pos, [dx,dy])

      last_pos = possible_moves.last
      last_piece = @board[last_pos]
      unless last_piece.nil?
        break if last_piece.color != self.color and last_piece.color != :null
      end
    end
    possible_moves
  end

  def update_pos(pos, diff) # [3,4] , [0, -1]
    x = diff[0] + pos[0] # 3
    y = diff[1] + pos[1] # 3
    [x,y] # [3,3]
  end


end
