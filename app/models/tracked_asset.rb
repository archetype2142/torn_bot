class TrackedAsset < ApplicationRecord
	self.inheritance_column = 'type'

	belongs_to :user

	TYPES = %w[Faction Member]
	validates :asset_number, presence: true


	def faction?
		type == "Faction"
	end

	def member?
		type == "Member"
	end
end
