class Tweet < ApplicationRecord
  validates :message, presence: true, length: {maximum: 140}

  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user
end
