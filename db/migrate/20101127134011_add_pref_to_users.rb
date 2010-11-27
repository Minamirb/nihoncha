class AddPrefToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pref, :string
  end

  def self.down
    remove_column :users, :pref
  end
end
