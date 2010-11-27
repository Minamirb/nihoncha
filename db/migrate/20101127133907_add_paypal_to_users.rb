class AddPaypalToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :paypal, :string
  end

  def self.down
    remove_column :users, :paypal
  end
end
