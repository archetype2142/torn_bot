# frozen_string_literal: true
require 'net/https'

class Admin::TrackedAssetsController < Admin::ApplicationController
  def create
    TrackedAsset.create!(permitted_params.to_unsafe_h.merge({ user_id:  current_user.id }))

    redirect_to admin_root_path
  end

  private

  def permitted_params
    params.require(:tracked_asset).permit(:asset_number, :type, :title)
  end
end
