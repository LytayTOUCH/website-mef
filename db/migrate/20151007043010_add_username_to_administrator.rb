class AddUsernameToAdministrator < ActiveRecord::Migration
  def change
    add_column :administrators, :username, :string
    add_index :administrators, :username, unique: true
  end
end
