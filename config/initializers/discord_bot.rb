require 'discordrb'

Bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_BOT_TOKEN'],
  client_id: ENV['DISCORD_APPLICATION_ID'],
  prefix: '/'
)

Dir["#{Rails.root}/app/services/discord_bot/commands/*.rb"].each { |file| require file }

puts "Invite URL: #{Bot.invite_url}"
