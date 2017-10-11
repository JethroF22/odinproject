require_relative 'tictactoe'

puts "Welcome to Advanced Ultra Turbo Tic-tac-toe 2.0!!"

loop do
  puts "Let's get started!"
  game = Game.new
  game.play
  puts "Press any key to play again or press 'Q' to quit:"
  choice = gets.chomp.upcase
  break if choice == "Q"
  system "clear"
end
