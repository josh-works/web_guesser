require 'sinatra'

get '/' do
  "the secret number is #{rand(0..100)}"
end

get '/datetime' do
  "the time is #{Time.now}"
end
