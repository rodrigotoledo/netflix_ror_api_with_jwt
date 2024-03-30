class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.json :genre
      t.integer :release_year
      t.references :director, null: false, foreign_key: { to_table: :people }
      t.float :rating
      t.integer :duration
      t.string :thumbnail
      t.string :trailer

      t.timestamps
    end
  end
end
