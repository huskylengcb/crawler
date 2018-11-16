class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :video_id
      t.string :duration
      t.string :img_url
      t.string :url
      t.string :name
      t.string :intro

      t.timestamps
    end
  end
end
