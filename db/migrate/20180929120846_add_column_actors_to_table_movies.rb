class AddColumnActorsToTableMovies < ActiveRecord::Migration[5.2]
  def change
  	add_column :movies, :actors, :jsonb
  end
end
