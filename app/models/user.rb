# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sauna_visits
  has_many :bookmarks
  has_many :bookmarked_saunas, through: :bookmarks, source: :sauna
end
