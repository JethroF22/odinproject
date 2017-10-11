require_relative "mastermind"
require_relative "guesser"
require_relative "master"


game = Mastermind.new
mode = game.start

case mode
when '1'      then new_game = AI.new
when '2'      then new_game = Guesser.new
when 'q', 'Q' then exit
end
new_game.play

=begin
This is the game of Mastermind, with a decent AI. Future plans for development
include:
- breaking down the input_combination method, which seems to be doing more than
  one thing. A good chunk of it could go to the Helpers module.
- coming up with a Knuthesque AI. This involves generating all of the possible
  combinations (1296 of them for six colors and 4 holes), then, for each guess,
  eliminate from the list the ones that don't match the pattern. Then minimax
  something something hard later aaaah no.
- using this as the backend for a GUI?
=end