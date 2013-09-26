require 'cinch'

class Logger
  include Cinch::Plugin
  listen_to :channel

  def listen(m)
    info "Someone said #{m.message}"
    user = m.user
    Message.create(body: m.message, nick: user.nick)
  end 
end
