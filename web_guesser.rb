require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)
response = {
  too_high: "too high",
  way_too_high: "way too high",
  too_low: "too low",
  way_too_low: "way too low"
}



get '/' do
  # throw params["guess"]
  guess = params['guess']
  erb :index, :locals => {
        :number => number,
        :response => response,
        :guess => guess
      }
end

get '/datetime' do
  "the TIME is #{Time.now}"
end
