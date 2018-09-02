def guessing_game
  secret = rand(1..10)

  guesses = 0
  while true
    puts "Guess a number!"
    guess = Integer(gets.chomp)
    guesses += 1

    case guess <=> secret
    when -1
      puts "#{guess} is too low!"
    when 0
      puts "You found the number #{guess}!"
      break
    when 1
      puts "#{guess} is too high!"
    end
  end
  puts "It took you #{guesses} guesses"
end

def shuffle_file(file_name)
  base = File.basename(file_name, ".*")
  extension = File.extname(file_name)
  File.open("#{base}-shuffle#{extension}", "w") do |f|
    File.readlines(file_name).shuffle.each do |line|
      f.puts line.chomp
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuff_file(ARGV.shift)
  else
    puts "Everyday I'm shuffling, please enter the file of your choosing:"
    file_name = gets.chomp
    shuffle_file(file_name)
  end
end
