require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

def check_guess(guess, number)
  if guess > number
    if guess > number + 5
      "Way too high!"
    else
    "Too high!"
  end
  elsif guess < number
    if guess < number - 5
      "Way too low!"
    else
    "Too low!"
  end
  else
    "Nailed it!"
  end
end

def background_color(guess, number)
  if guess > number
    if guess > number + 5
      "#ff0000"
    else
      "#ff6666"
    end
  elsif guess < number
    if guess < number - 5
      "#ff0000"
    else
      "#ff6666"
    end
  elsif guess == number
    "green"
  else
    "red"
  end
end


get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess, number)
  color = background_color(guess, number)
  erb :index, :locals => {:number => number, :message => message, :color => color}
end

