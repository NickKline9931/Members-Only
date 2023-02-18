class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 6..15 }
  validates :email, presence: true, uniqueness: true, email: true
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
