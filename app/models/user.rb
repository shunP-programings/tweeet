class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :pass, presence: true, length: {minimum: 4}
end
