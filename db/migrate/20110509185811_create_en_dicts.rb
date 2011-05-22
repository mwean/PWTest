class CreateEnDicts < ActiveRecord::Migration
  def self.up
    create_table :en_dicts do |t|
      t.string "word", :null => false
      t.timestamps
    end
    add_index :en_dicts, "word", :unique => true
  end

  def self.down
    drop_table :en_dicts
  end
end
