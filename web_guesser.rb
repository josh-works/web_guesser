require 'pry'
require 'sinatra'
require 'sinatra/reloader'


class WebGuesser
  attr_reader :number, :response

  def initialize
    @number = rand(0..100)
  end

  RESPONSE = {
    too_high: "too high",
    way_too_high: "way too high",
    too_low: "too low",
    way_too_low: "way too low",
    correct: "correct! the number is #{@number}",
    waiting: "Please enter a guess"
  }

  BGCOLORS = {
  way_too_high: "#DC143C",
  too_high: "#CD5C5C",
  way_too_low: "#00008B",
  too_low: "#00FFFF",
  correct: "#97c475",
  }


  def build_response(guess = nil )
    return RESPONSE[:waiting] if guess.nil?
    return RESPONSE[:way_too_high] if (guess - number ) > 5
    return RESPONSE[:too_high] if guess > number
    return RESPONSE[:way_too_low] if (guess - number ) < -5
    return RESPONSE[:too_low] if guess < number
    return RESPONSE[:correct] if guess == number
  end

  def background_color(guess)
    return BGCOLORS[:way_too_high] if (guess - number ) > 5
    return BGCOLORS[:too_high] if guess > number
    return BGCOLORS[:way_too_low] if (guess - number ) < -5
    return BGCOLORS[:too_low] if guess < number
    return BGCOLORS[:correct] if guess == number
  end
end



web_guesser = WebGuesser.new

get '/' do
  guess = params['guess'].to_i
  erb :index, :locals => {
        :message => web_guesser.build_response(guess),
        :background => web_guesser.background_color(guess)
      }
end

get '/datetime' do
  "the TIME is #{Time.now}"
end
