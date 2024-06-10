module DiscordCommands
  module Ping
    extend Discordrb::Commands::CommandContainer

    Bot.message(content: "ping") do |event|
      event.respond('Pong!')
    end
  end
end
