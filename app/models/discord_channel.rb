# frozen_string_literal: true

class DiscordChannel < ApplicationRecord
  belongs_to :user
end
