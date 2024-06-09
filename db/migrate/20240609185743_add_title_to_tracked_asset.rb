class AddTitleToTrackedAsset < ActiveRecord::Migration[7.1]
  def change
    add_column :tracked_assets, :title, :string
  end
end
