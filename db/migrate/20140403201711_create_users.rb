class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end
    add_index :users, :email

    def self.down
    	drop_table :users
    end

  end
end
