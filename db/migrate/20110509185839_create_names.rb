class CreateNames < ActiveRecord::Migration
  def self.up
    create_table :names do |t|
      t.string "word", :null => false
      t.timestamps
    end
    add_index :names, "word", :unique => true
  end

  def self.down
    drop_table :names
  end
end
