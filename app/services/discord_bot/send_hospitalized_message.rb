
class DiscordBot::SendHospitalizedMessage < ApplicationService
  def call
    send_message

    result
  end

  private

  def asset
    context[:asset]
  end

  def channel_id
    asset.user.discord_channels.first.channel_id
  end

  def members
  	params[:members]
  end

  def send_message
    Bot.send_message(channel_id, message)
  end

  def message
  	"#{members} are currently in hospital."
  end
end
