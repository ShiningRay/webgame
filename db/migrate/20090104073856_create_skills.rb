class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
    add_index :skills, :name, :unique => true
  end

  def self.down
    drop_table :skills
  end
end
