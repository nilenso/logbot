class Message
  include DataMapper::Resource
  
  property :id, Serial
  property :body, Text
  property :nick, String
end
