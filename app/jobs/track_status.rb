# frozen_string_literal: true

class TrackStatus
  include Sidekiq::Job

  def perform(asset_id)
  	asset = TrackedAsset.find(asset_id)
  	asset.update(last_checked_at: DateTime.now)
  end
end
