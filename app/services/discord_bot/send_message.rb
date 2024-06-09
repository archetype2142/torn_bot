require 'discordrb'

class DiscordBot::SendMessage < ApplicationService
  def call
    preload(:discord_bot)

    transaction do
      send_message
    end

    result
  end

  private

  def discord_bot
    bot = Discordrb::Bot.new(token: ENV['DISCORD_BOT_TOKEN'])

    bot.message do |event|
      puts "Event received: #{event.inspect}"
      event.respond 'Pong!'
    end

    bot.run
  end
end
