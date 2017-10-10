require 'io/console'
require_relative 'helpers'

class Mastermind
  include Helpers

  attr_writer :moves, :secret

  def initialize
    @moves = 0
  end

  def start
    system("clear")
    puts "Welcome to Mastermind!"
    puts "When you get a star *, that means you got a right color in the right place."
    puts "When you get a dot, that means a correct color, but in the wrong place."
    puts "Any underscores represent wrong colors."
    puts "\nPress 1 to play as the Mastermind and 2 to play as guesser!"

    choice = STDIN.getch
    choice
  end

  def input_combination
    loop do
      combination = gets.chomp.split('')
      exit if combination.join.upcase == 'Q'
      combination.map! { |digit| digit.to_i }
      if valid?(combination)
        @moves += 1
        return combination
      end
      puts "Please enter exactly four digits between 1 and 6."
    end
  end

end