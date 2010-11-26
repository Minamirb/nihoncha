class CreateCashes < ActiveRecord::Migration
  def self.up
    create_table :cashes do |t|
      t.string :name
      t.integer :price
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :cashes
  end
end
