class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :director, class_name: 'Director', foreign_key: 'director_id'
  has_many :actors_movies, join_table: :actors_movies, class_name: 'ActorMovie'
  has_many :actors, through: :actors_movies
  has_many :reviews
end
