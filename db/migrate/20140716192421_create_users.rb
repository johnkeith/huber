class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :username, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :avatar_url, null: false
      t.string :access_token, null: false
      t.string :account_created, null: false
      t.string :current_location
      t.text   :description

      t.timestamps
    end

    add_index "users", ["uid", "username"], name: "index_users_on_uid_and_username", unique: true, using: :btree
  end
end
