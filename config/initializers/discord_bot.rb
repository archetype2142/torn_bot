require 'discordrb'

Bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_BOT_TOKEN'],
  client_id: ENV['DISCORD_APPLICATION_ID'],
  prefix: '/'
)

Dir["#{Rails.root}/lib/discord_commands/*.rb"].each { |file| require file }

puts "Invite URL: #{Bot.invite_url}"
