class Sauna < ApplicationRecord
  has_many :sauna_visits
  has_many :bookmarks
  has_many :bookmarked_by, through: :bookmarks, source: :user
  has_one_attached :image
end
