class CreateTiles < ActiveRecord::Migration
  def self.up
    create_table :tiles do |t|
      t.string :name
      t.binary :image_file_data
      t.timestamps
    end
  end

  def self.down
    drop_table :tiles
  end
end
