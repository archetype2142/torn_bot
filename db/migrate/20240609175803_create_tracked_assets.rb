class CreateTrackedAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :tracked_assets do |t|
      t.string :type
      t.string :asset_number

      t.timestamps
    end
  end
end
