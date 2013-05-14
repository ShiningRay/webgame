class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.integer :user_id, :null => false
      t.integer :level, :null => false, :default => 1
      t.integer :hp, :null => false, :default => 100
      t.integer :hp_max, :null => false, :default => 100
      t.integer :mp, :null => false, :default => 100
      t.integer :mp_max, :null => false, :default => 100
      t.integer :armor, :null => false, :default => 0
      t.integer :damage, :null => false, :default => 10
      t.integer :exp, :null => false, :default => 0
      t.integer :map_id
      t.integer :map_x
      t.integer :map_y
      t.text :inventory
      t.text :skills
      t.timestamps
    end
    add_index :characters, :user_id
    add_index :characters, :map_id
  end

  def self.down
    drop_table :characters
  end
end
