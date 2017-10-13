require 'sinatra'
require 'sinatra/reloader' if development?

class Guesser

  attr_reader :number, :guesses_remaining, :bgcolor, :message

  def initialize
    new_game
  end

  def new_game
    @number = rand(100)
    @guesses_remaining = 6
  end

  def check_guess(guess)
    if @number == guess
      @bgcolor = "#33CC00"
    elsif (@number - guess).abs < 5
      @bgcolor = "#FF3333"
      way = 'Too'
    else
      @bgcolor = "#FF0000"
      way = 'Way too'
    end

    if guess > @number
      @message = "#{way} high!"
    elsif guess < @number
      @message = "#{way} low!"
    else
      new_game
      @message = "You got it right! Try guessing a new number."
    end
    @guesses_remaining -= 1
    if @guesses_remaining <= 0
      lose
    else
      @message += "\nYou have #{@guesses_remaining} guesses left."
    end
  end

  def lose
    @message += "\nYou lose! Try guessing a new number."
    new_game
  end

end

guesser = Guesser.new

get '/' do
  guess = params['guess'].to_i
  guesser.check_guess(guess)
  cheat = params['cheat']
  erb :index, locals: {number: guesser.number, message: guesser.message, bgcolor: guesser.bgcolor, guesses: guesser.guesses_remaining, cheat: cheat}
end
