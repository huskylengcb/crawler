class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :intro
      t.integer :score
      t.string :url
      t.string :img_url
      t.integer :source

      t.timestamps
    end
  end
end
