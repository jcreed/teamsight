class AddPersistenceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :crypted_password, :string
    add_column :users, :persistence_token, :string
  end

  def self.down
    remove_column :users, :crypted_password, :string
    remove_column :users, :persistence_token, :string
  end
end
