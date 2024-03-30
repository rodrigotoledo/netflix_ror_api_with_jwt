class Director < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  self.table_name = 'people'
  default_scope { where(designation: 'director') }
  validates :name, :designation, presence: true
end
