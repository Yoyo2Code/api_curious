class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :auth_token
      t.string :picture_url
      t.integer :followers
      t.integer :following

      t.timestamps
    end
  end
end
