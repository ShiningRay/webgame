class CreateMaps < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.transaction do
      create_table :maps do |t|
        t.string :name, :null => false
        t.text :matrix
        t.integer :width, :null => false
        t.integer :height, :null => false
        t.timestamps
      end
      add_index :maps, :name
    end
  end

  def self.down
    drop_table :maps
  end
end
