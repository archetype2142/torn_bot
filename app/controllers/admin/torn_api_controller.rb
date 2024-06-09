# frozen_string_literal: true
require 'net/https'

class Admin::TornApiController < Admin::ApplicationController
  def index; end

  def fetch_asset
    if params[:faction_id].present?
      uri = URI.parse("https://api.torn.com/faction/#{params[:faction_id]}?selections=&key=#{current_user.api_key}")
    else
      uri = URI.parse("https://api.torn.com/user/#{params[:user_id]}?selections=&key=#{current_user.api_key}")
    end

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.get(uri.request_uri)

    if params[:faction_id].present?
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('faction-result', partial: 'admin/torn_api/faction',
                                                      locals: { factions: JSON.parse(res.body) })
          ]
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('faction-result', partial: 'admin/torn_api/member',
                                                      locals: { member: JSON.parse(res.body) })
          ]
        end
      end
    end
  end
end
