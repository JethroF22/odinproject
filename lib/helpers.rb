# This module contains methods used by the Mastermind game and which don't
# refer to any instance variables. I hadn't learned I *could* use instance
# variables until I coded Chess.

module Helpers

  # Guesser uses this methods to generate its secret; AI uses it to generate
  # its guesses. Takes no inputs and outputs an array of 4 random numbers
  # between 1 and 6.
  def random_array
    arr = []
    4.times do
      arr << rand(6)+1
    end
    arr
  end

  # Validates a player's input. Returns true if guess is an array of 4 numbers
  # between 1 and 6.
  def valid?(guess)
    guess.size == 4 and guess.all? { |num| num.between?(1,6) }
  end

  # Compares a guess and a pattern. Returns a string. The string begins with
  # one * for each correct color in the right place. It then has one . for each
  # correct color in the wrong place. It gets padded with _s until it is 4 char-
  # acters long.

  # This method is mostly due to Keith Mosier. Thanks, Keith!
  def check(guess, pattern)
    output = []
    target = pattern.dup
    attempt = guess.dup
    0.upto(3) do |i|
      if attempt[i] == target[i]
        output << "*"
        target[i] = "X"
        attempt[i] ="XXX"
      end
    end
    0.upto(3) do |i|
      0.upto(3) do |j|
        if attempt[j] == target[i]
          output << "."
          target[i] = "Y"
          attempt[j] = "YYY"
        end
      end
    end
    (4 - output.size).times { output << "_" }
    output = output.join
    win if output == "****"
    output
  end

  def try_again
    puts "Do you want to play again? [Y/N]"
    answer = STDIN.getch.upcase
    if answer == 'Y'
      initialize
      play
    else
      exit
    end
  end

end
