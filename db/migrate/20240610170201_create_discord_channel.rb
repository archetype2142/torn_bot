class CreateDiscordChannel < ActiveRecord::Migration[7.1]
  def change
    create_table :discord_channels do |t|
      t.string :channel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
