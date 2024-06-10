# frozen_string_literal: true

class TrackStatus
  include Sidekiq::Job

  def perform(asset_id)
    asset = TrackedAsset.find(asset_id)

    asset.faction? ? track_faction(asset) : track_member(asset)

    asset.update(last_checked_at: DateTime.now)
  end

  private

  def track_faction(asset)
    uri = URI.parse("https://api.torn.com/faction/#{asset.asset_number}?selections=&key=#{asset.user.api_key}")
    response = send_request(uri)

    return unless response.is_a?(Net::HTTPSuccess)
    hospitalized_members = JSON.parse(response.body)['members'].select do |_, member|
      member['status']['state'] == 'Hospital'
    end

    ::DiscordBot::SendHospitalizedMessage.call(context: { asset: asset }, params: { members: hospitalized_members })
  end

  def track_member(asset)
    uri = URI.parse("https://api.torn.com/user/#{asset.asset_number}?selections=&key=#{asset.user.api_key}")
    response = send_request(uri)

    byebug
  end

  def send_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.get(uri.request_uri)
  end
end
