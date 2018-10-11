class CreateVideos < ActiveRecord::Migration[5.2]
  def change
  	create_table :videos do |t|
  		t.string :title
  		t.string :intro
  		t.string :img_url
  		t.string :url
  		t.jsonb :actors
  		t.integer :source
  		t.string :score
  		t.string :duration
  		t.integer :video_type

  	  t.timestamps
  	end
  end
end
