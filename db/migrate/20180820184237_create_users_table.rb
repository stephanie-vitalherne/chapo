class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :email
      u.string :username
      u.string :password_hash
      u.date :birthday
      u.datetime :created_at
      u.datetime :posted_at
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
