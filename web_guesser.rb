require 'sinatra'

get '/' do
  "hello, world"
end

get '/datetime' do
  "the time is #{Time.now}"
end
