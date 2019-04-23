class AddUsernameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_index :users, :username
  end
end
