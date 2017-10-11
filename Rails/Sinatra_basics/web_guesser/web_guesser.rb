require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess'].to_i
  message, bgcolor = check_guess(guess)
  erb :index, locals: {number: settings.number, message: message, bgcolor: bgcolor}
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
    message = "You got it right!"
  end

  return message, bgcolor
end
