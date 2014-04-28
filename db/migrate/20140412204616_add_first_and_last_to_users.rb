class AddFirstAndLastToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    remove_column :users, :name
  end
	
	def self.down
    remove_column :users, :firstname, :string
    remove_column :users, :lastname, :sting
    add_column :users, :name
  end
end
