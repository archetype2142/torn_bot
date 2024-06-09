# frozen_string_literal: true
require 'net/https'

class FactionsController < ApplicationController
  def index; end

  def members
    uri = URI.parse("https://api.torn.com/faction/#{params[:faction_id]}?selections=&key=#{params[:api_key]}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.get(uri.request_uri)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('faction-result', partial: 'factions/faction',
                                                    locals: { factions: JSON.parse(res.body) })
        ]
      end
    end
  end
end
