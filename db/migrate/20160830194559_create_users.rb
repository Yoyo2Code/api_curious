class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :github_uid, null: false
      t.string :name, null: false
      t.string :display_name

      t.timestamps
    end
  end
end
