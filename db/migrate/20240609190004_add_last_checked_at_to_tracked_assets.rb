class AddLastCheckedAtToTrackedAssets < ActiveRecord::Migration[7.1]
  def change
    add_column :tracked_assets, :last_checked_at, :datetime
  end
end
