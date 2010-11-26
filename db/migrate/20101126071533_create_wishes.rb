class CreateWishes < ActiveRecord::Migration
  def self.up
    create_table :wishes do |t|
      t.string :uri
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_url
      t.string :thumbneil_url
      t.boolean :bought, :default => false
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :wishes
  end
end
