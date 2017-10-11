require_relative 'connect_four'

puts "Please enter the player names:"
print "Player 1: "
player1 = gets.chomp
print "Player 2: "
player2 = gets.chomp

game = Game.new([player1, player2])
game.play
