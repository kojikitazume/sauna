class SaunaVisit < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
end
