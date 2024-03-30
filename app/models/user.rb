class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :name, :password, presence: true
  normalizes :email, with: ->(email) { email.strip.downcase }
end
