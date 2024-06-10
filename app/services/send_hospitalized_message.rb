
class SendHospitalizedMessage < ApplicationService
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
    members.each do |member|
      Bot.send_message(channel_id, parsed_message(member)[:content], true, parsed_message(member)[:embed])
    end
  end

  def faction_member(member)
    member_id = member[0]
    member = member[1]

    {
      "content": ".",
      "embed": {
        "title": "#{member['name']}",
        "description": "A user needs support",
        "url": "https://torn.com/profiles.php?XID=#{member_id}",
        "color": 1969715,
        "timestamp": DateTime.now.strftime("%FT%T%:z"),
        "footer": {
          "icon_url": "https://tornbot.pro/assets/bot-974efc10e7b9e4a72260dfb4911aecdcc13df45a373957effbe9a341e3037f79.png",
          "text": "via TornBot"
        },
        "thumbnail": {
          "url":  member["profile_image"],
        },
        "author": {
          "name": 'Torn Bot',
          "url": 'https://tornbot.pro',
          "icon_url": "https://tornbot.pro/assets/bot-974efc10e7b9e4a72260dfb4911aecdcc13df45a373957effbe9a341e3037f79.png",
        },
        "fields": [
          {
            "name": "Status",
            "value": "
            #{member['status']['description']}\n
            **Reason**: #{member['status']['details'].html_safe}
            **Last active:** #{member['last_action']['status'] == 'Offline' ? ':red_circle:' : ':green_circle:'} #{member['last_action']['relative']}
            ",
          },
          {
            "name": "Faction",
            "value": "#{asset.title}",
            "inline": true
          },
        ]
      }
    }
  end

  def parsed_message(member)
    return faction_member(member) if member.is_a?(Array)

    {
      "content": ".",
      "embed": {
        "title": "#{member['name']}",
        "description": "A user needs support",
        "url": "https://torn.com/profiles.php?XID=#{member['player_id']}",
        "color": 1969715,
        "timestamp": DateTime.now.strftime("%FT%T%:z"),
        "footer": {
          "icon_url": "https://tornbot.pro/assets/bot-974efc10e7b9e4a72260dfb4911aecdcc13df45a373957effbe9a341e3037f79.png",
          "text": "via TornBot"
        },
        "thumbnail": {
          "url":  member["profile_image"],
        },
        "author": {
          "name": 'Torn Bot',
          "url": 'https://tornbot.pro',
          "icon_url": "https://tornbot.pro/assets/bot-974efc10e7b9e4a72260dfb4911aecdcc13df45a373957effbe9a341e3037f79.png",
        },
        "fields": [
          {
            "name": "Status",
            "value": "
            #{member['status']['description']}\n
            **Reason**: #{member['status']['details']}
            **Last active:** #{member['last_action']['status'] == 'Offline' ? ':red_circle:' : ':green_circle:'} #{member['last_action']['relative']}
            **Life:** #{member['life']['current']} / #{member['life']['maximum']}
            ",
          },
          {
            "name": "Faction",
            "value": "#{member['faction']['faction_tag']} - #{member['faction']['faction_name']}",
            "inline": true
          },
        ]
      }
    }
  end
end
