class CreateAdjs < ActiveRecord::Migration
  def self.up
    create_table :adjs do |t|
      t.string "adj"
      t.timestamps
    end
  end

  def self.down
    drop_table :adjs
  end
end
