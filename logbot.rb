require './initialize'
require './logger'
require './models/init'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "LogBot"
    c.server = "irc.freenode.org"
    c.channels = ["#cinch-bots"]
    c.plugins.plugins = [Logger] 
  end
end

bot.start
