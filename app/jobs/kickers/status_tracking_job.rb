# frozen_string_literal: true

class Kickers::StatusTrackingJob
  include Sidekiq::Job

  def perform
    User.all.each do |user|
      user.tracked_assets.select(:id).each do |asset|
        ::TrackStatus.perform_async(asset.id)
      end
    end
  end
end
