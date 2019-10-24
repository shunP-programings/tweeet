class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :pass, presence: true, length: {minimum: 4}
  
  has_many :tweets
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet

  def self.authenticate(uid, pass)
    user = User.find_by(uid: uid)
    if user and BCrypt::Password.new(user.pass) == pass
      user
    else
      nil
    end
  end
end
