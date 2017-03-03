require 'sinatra'
require 'sinatra/reloader'


random_number = rand(0..100)
get '/' do
  "the secret number is #{random_number}"
end

get '/datetime' do
  "the time is #{Time.now}"
end
