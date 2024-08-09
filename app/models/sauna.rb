# frozen_string_literal: true

class Sauna < ApplicationRecord
  has_many :sauna_visits
  has_many :bookmarks
  has_many :bookmarked_by, through: :bookmarks, source: :user
end
