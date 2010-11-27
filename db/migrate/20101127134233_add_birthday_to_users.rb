class AddBirthdayToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :birthdey, :datetime
  end

  def self.down
    remove_column :users, :birthdey
  end
end
