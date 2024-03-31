class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password

  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, if: -> { password.present? && !password.nil? }, on: :update

  normalizes :email, with: ->(email) { email.strip.downcase }
end
