class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :photo
      t.text :info
      t.string :designation

      t.timestamps
    end
  end
end
