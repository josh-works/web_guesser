require 'pry'
require 'sinatra'
require 'sinatra/reloader'


class WebGuesser
  attr_reader :number, :response

  def initialize
    @number = rand(0..100)
    @response = {
      too_high: "too high",
      way_too_high: "way too high",
      too_low: "too low",
      way_too_low: "way too low",
      correct: "correct! the number is #{number}"
    }
  end

  def build_response(guess)
    return response[:way_too_high] if (guess - number ) > 5
    return response[:too_high] if guess > number
    return response[:way_too_low] if (guess - number ) < -5
    return response[:too_low] if guess < number
    return response[:correct] if guess == number
  end
end

web_guesser = WebGuesser.new

get '/' do
  guess = params['guess'].to_i
  erb :index, :locals => {
        :message => web_guesser.build_response(guess)
      }
end

get '/datetime' do
  "the TIME is #{Time.now}"
end
