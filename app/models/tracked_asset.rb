class TrackedAsset < ApplicationRecord
	self.inheritance_column = 'type'

	belongs_to :user

	validates :asset_number, presence: true
end
