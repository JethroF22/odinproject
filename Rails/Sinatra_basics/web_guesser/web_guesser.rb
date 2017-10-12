require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params['guess'].to_i
  check_guess(guess)
  erb :index, locals: {number: settings.number, message: message, bgcolor: bgcolor, guesses: Guesser.guesses_remaining}
end

class Guesser

  def new_game
    set :number, rand(100)
    @@guesses_remaining = 5
  end

  def check_guess(guess)
    if settings.number == guess
      bgcolor = "#33CC00"
    elsif (settings.number - guess).abs < 5
      bgcolor = "#FF3333"
      way = 'Too'
    else
      bgcolor = "#FF0000"
      way = 'Way too'
    end

    if guess > settings.number
      message = "#{way} high!"
    elsif guess < settings.number
      message = "#{way} low!"
    else
      new_game
      message = "You got it right! Try guessing a new number."
    end
    @@guesses_remaining -= 1
    if @@guesses_remaining <= 0
      lose
    else
      message += "\nYou have #{guesses_remaining} guesses left."
    end
  end

  def lose
    message += "\nYou lose! Try guessing a new number."
    new_game
  end

end
