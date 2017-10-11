require_relative "mastermind"
require_relative "guesser"
require_relative "master"

testfile = File.open("test.log", "a")
totalmoves = 0
games = 3000

games.times do |i|
  game = AI.new
  game.secret = game.random_array
  moves = game.play
  totalmoves += moves

end
testfile.puts "#{games} games solved in a total of #{totalmoves} moves, for an average of #{(totalmoves/games.to_f).round(3)}"
testfile.close
