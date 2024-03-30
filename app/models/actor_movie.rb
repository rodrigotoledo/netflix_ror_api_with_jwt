class ActorMovie < ApplicationRecord
  self.table_name = 'actors_movies'
  belongs_to :movie
  belongs_to :actor
end