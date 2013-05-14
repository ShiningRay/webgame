class CreateCombats < ActiveRecord::Migration
  def self.up
    create_table :combats do |t|
      t.string :characters
      t.string :mobs
      t.integer :map_id, :null => false
      t.integer :map_x, :map_y
      t.integer :turn, :null => false
      t.timestamps
    end
    add_index :combats, :map_id
  end

  def self.down
    drop_table :combats
  end
end
