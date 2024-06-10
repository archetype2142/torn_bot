# frozen_string_literal: true
require 'net/https'

class Admin::TrackedAssetsController < Admin::ApplicationController
  def create
    TrackedAsset.create!(permitted_params.to_unsafe_h.merge({ user_id:  current_user.id }))

    redirect_to admin_root_path, notice: 'Tracked asset created successfully'
  end

  def destroy
    asset = current_user.tracked_assets.find(params[:id])

    if asset.destroy
      redirect_to admin_root_path, notice: 'Tracked asset deleted successfully'
    else
      redirect_to admin_root_path, alert: 'Failed to delete tracked asset'
    end
  end

  private

  def permitted_params
    params.require(:tracked_asset).permit(:asset_number, :type, :title)
  end
end
