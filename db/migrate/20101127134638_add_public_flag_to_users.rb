class AddPublicFlagToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :public_flag, :boolean, :default => true
  end

  def self.down
    remove_column :users, :public_flag
  end
end
