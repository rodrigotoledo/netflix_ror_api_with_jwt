class Actor < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  self.table_name = 'people'
  default_scope { where(designation: 'actor') }
  has_many :actors_movies, join_table: :actors_movies, class_name: 'ActorMovie'
  has_many :movies, through: :actors_movies
end
