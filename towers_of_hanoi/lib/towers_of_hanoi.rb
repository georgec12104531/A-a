class TowersOfHanoi
  attr_reader :towers, :count

  def initialize
    @towers = [[3, 2, 1],[],[]]
    @count = 0
  end

  def move(from_tower, to_tower)
    removed_disk = towers[from_tower].pop
    towers[to_tower].push(removed_disk)
  end

  def valid_move?(from_tower, to_tower)
    #true if from_tower has a smaller disk than to_tower
    return false if towers[from_tower].empty?
    return true if towers[to_tower].empty? || towers[from_tower].last < towers[to_tower].last
  end

  def won?
    return true if towers[1].length == 3 || towers[2].length == 3
    return false
  end

  def play
    until won?
      puts render
      get_move
    end
    conclude
  end

  def get_move
    @count += 1
    puts "What's your move player? (ex. from_tower to_tower)"
    input = gets.chomp
    from_tower, to_tower = input.split(" ").map(&:to_i)
    until valid_move?(from_tower, to_tower)
      from_tower, to_tower = get_valid_move
    end
    move(from_tower, to_tower)

  end

  def get_valid_move
    puts "Please enter a valid move"
    input = gets.chomp
    from_tower, to_tower = input.split(" ").map(&:to_i)
  end


  def render
    top_row = towers.map { |tower| tower.length == 3 ? tower[2] : " " }
    middle_row = towers.map { |tower| tower.length >= 2 ? tower[1] : " " }
    bot_row = towers.map { |tower| tower.length >= 1 ? tower[0] : " "}
    puts "#{top_row.join(" ")}\n#{middle_row.join(" ")}\n#{bot_row.join(" ")}\n_ _ _"

  end

  def conclude
    puts "Congrats! thanks for playing, you've won Towers of Hanoi, you made #{count} moves"
  end
end

if __FILE__ == $PROGRAM_NAME
  t = TowersOfHanoi.new
  t.play

end
