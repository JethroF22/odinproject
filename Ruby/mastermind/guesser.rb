require_relative 'mastermind'

class Guesser < Mastermind

  def initialize
    super
    @secret = random_array
  end

  def play
    while @moves < 12
      player_guess = move
      puts check(player_guess, @secret)
    end
    puts "You lose. The secret was '#{@secret.join}'."
    try_again
  end

  def move
    puts "#{12 - @moves} #{12 - @moves == 1 ? 'move' : 'moves'} remaining."
    puts "To place your pegs, please choose 4 digits between 1 and 6."
    input_combination
  end

  def win
    puts "Congratulations, you guessed the secret '#{@secret.join}' in #{@moves} moves!"
    @moves = 12
    try_again
  end

end