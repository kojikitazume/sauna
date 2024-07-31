class User < ApplicationRecord
    has_many :sauna_visits
    has_many :bookmarks
    has_many :bookmarked_saunas, through: :bookmarks, source: :sauna
end
