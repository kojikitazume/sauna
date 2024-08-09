# frozen_string_literal: true

class SaunaVisit < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
end
