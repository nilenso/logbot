require './initialize'
require './models/init'
require 'sinatra'

get '/' do
  erb :messages, locals: { messages: Message.all }
end

post '/api/messages' do
  puts params
  message = Message.new(body: params[:body], nick: params[:nick])
  if message.save
    "Message saved!"
  else
    [400, ["There was an error saving the message."]]
  end
end
