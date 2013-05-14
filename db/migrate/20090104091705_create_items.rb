class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
    add_index :items, :name, :unique => true
  end

  def self.down
    drop_table :items
  end
end
