class AddAdressToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :adress, :text
  end

  def self.down
    remove_column :users, :adress
  end
end
