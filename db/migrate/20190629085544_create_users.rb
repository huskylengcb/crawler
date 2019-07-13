class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.integer :gender
      t.string :country
      t.string :province
      t.string :city
      t.string :avatarUrl
      t.string :openid

      t.timestamps
    end
  end
end
