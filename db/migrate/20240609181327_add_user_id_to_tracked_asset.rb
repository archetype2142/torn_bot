class AddUserIdToTrackedAsset < ActiveRecord::Migration[7.1]
  def change
    add_column :tracked_assets, :user_id, :integer
  end
end
